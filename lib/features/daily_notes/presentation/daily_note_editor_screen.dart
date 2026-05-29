import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../domain/daily_note.dart';
import 'providers/daily_notes_provider.dart';

/// Create or edit a daily observation.
/// Pass [existingNote] to edit; omit it for a new note.
class DailyNoteEditorScreen extends ConsumerStatefulWidget {
  const DailyNoteEditorScreen({
    super.key,
    required this.childId,
    this.existingNote,
  });

  final String childId;
  final DailyNote? existingNote;

  @override
  ConsumerState<DailyNoteEditorScreen> createState() =>
      _DailyNoteEditorScreenState();
}

class _DailyNoteEditorScreenState
    extends ConsumerState<DailyNoteEditorScreen> {
  // late: both assigned unconditionally in initState before first use.
  late final TextEditingController _content;
  late ShiftType _shift;
  final _speech = SpeechToText();
  bool _speechAvailable = false;
  bool _isListening = false;
  bool _isSaving = false;
  String _textBeforeListening = '';
  String _partialWords = '';

  @override
  void initState() {
    super.initState();
    final existing = widget.existingNote;
    _content = TextEditingController(text: existing?.content ?? '');
    _shift = existing?.shift ?? ShiftType.forTime(DateTime.now());
    _initSpeech();
  }

  @override
  void dispose() {
    _content.dispose();
    _speech.stop();
    super.dispose();
  }

  Future<void> _initSpeech() async {
    try {
      final available = await _speech.initialize(
        onError: (error) {
          log('Speech error: $error', name: 'DailyNoteEditor');
          if (mounted) setState(() => _isListening = false);
        },
        onStatus: (status) {
          // 'notListening' fires when the engine stops (pause timeout or stop()).
          if ((status == 'notListening' || status == 'done') && mounted) {
            _commitPartial();
          }
        },
      );
      if (mounted) setState(() => _speechAvailable = available);
    } catch (e) {
      log('Speech init failed: $e', name: 'DailyNoteEditor');
    }
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _speech.stop();
      return; // onStatus fires -> _commitPartial() called there
    }
    if (!_speechAvailable) return;

    _textBeforeListening = _content.text;
    _partialWords = '';
    setState(() => _isListening = true);

    final started = await _speech.listen(
      onResult: (result) {
        final words = result.recognizedWords;
        if (result.finalResult) {
          _partialWords = '';
          if (words.isNotEmpty) _appendWords(words);
        } else {
          // Show partial transcript in real time.
          _partialWords = words;
          final base = _textBeforeListening.trimRight();
          final preview = base.isEmpty ? words : '$base $words';
          _content.value = TextEditingValue(
            text: preview,
            selection: TextSelection.collapsed(offset: preview.length),
          );
        }
      },
      listenFor: const Duration(seconds: 60),
      pauseFor: const Duration(seconds: 3),
    );

    // listen() failed to start — reset immediately.
    if (!started && mounted) {
      setState(() => _isListening = false);
    }
  }

  void _appendWords(String words) {
    final base = _textBeforeListening.trimRight();
    final appended = base.isEmpty ? words : '$base $words';
    _textBeforeListening = appended;
    _content.value = TextEditingValue(
      text: appended,
      selection: TextSelection.collapsed(offset: appended.length),
    );
  }

  void _commitPartial() {
    if (_partialWords.isNotEmpty) _appendWords(_partialWords);
    _partialWords = '';
    if (mounted) setState(() => _isListening = false);
  }

  Future<void> _save() async {
    final text = _content.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.observationEmpty)),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existingNote;

      final note = DailyNote(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        authorId: user?.id ?? 'dev-user-001',
        authorName: user?.displayName ?? user?.email ?? 'Unknown',
        shift: _shift,
        content: text,
        occurredAt: existing?.occurredAt ?? now,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
        isSynced: false,
      );

      await ref.read(dailyNotesRepositoryProvider).save(note);
      if (mounted) context.pop();
    } catch (e, st) {
      log('Save failed', error: e, stackTrace: st, name: 'DailyNoteEditor');
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(AppStrings.saveFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isEditing = widget.existingNote != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? AppStrings.editObservation : AppStrings.newObservation),
        actions: [
          if (_isSaving)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            TextButton(
              onPressed: _save,
              child: Text(
                AppStrings.save,
                style: AppTextStyles.button(colors.primary),
              ),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shift selector
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              0,
            ),
            child: _ShiftSelector(
              selected: _shift,
              onChanged: (s) => setState(() => _shift = s),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Divider(height: 1),
          // Content field
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: TextField(
                controller: _content,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.multiline,
                style: AppTextStyles.body(colors.onSurface),
                decoration: InputDecoration(
                  hintText: AppStrings.observationHint,
                  hintStyle: AppTextStyles.body(colors.onSurfaceVariant),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                ),
              ),
            ),
          ),
        ],
      ),
      // Voice-to-text FAB
      floatingActionButton: _speechAvailable
          ? FloatingActionButton(
              onPressed: _isSaving ? null : _toggleListening,
              backgroundColor:
                  _isListening ? AppColors.red : AppColors.teal400,
              tooltip: _isListening ? AppStrings.stopVoiceInput : AppStrings.startVoiceInput,
              child: Icon(
                _isListening ? Icons.mic : Icons.mic_none,
                color: AppColors.white,
                semanticLabel:
                    _isListening ? AppStrings.stopVoiceInput : AppStrings.startVoiceInput,
              ),
            )
          : null,
    );
  }
}

/// Segmented shift selector (Morning / Afternoon / Night).
class _ShiftSelector extends StatelessWidget {
  const _ShiftSelector({required this.selected, required this.onChanged});

  final ShiftType selected;
  final ValueChanged<ShiftType> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SegmentedButton<ShiftType>(
      segments: ShiftType.values
          .map(
            (s) => ButtonSegment(
              value: s,
              label: Text(s.displayName),
            ),
          )
          .toList(),
      selected: {selected},
      onSelectionChanged: (set) => onChanged(set.first),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primaryContainer;
          }
          return null;
        }),
      ),
    );
  }
}

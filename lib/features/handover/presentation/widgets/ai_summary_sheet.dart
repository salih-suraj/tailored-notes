import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/network/supabase_client.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/time/uk_time.dart';
import '../../../../shared/models/app_strings.dart';
import '../../../behaviour/presentation/providers/behaviour_provider.dart';
import '../../../checklists/presentation/providers/bath_temp_provider.dart';
import '../../../children/presentation/providers/children_provider.dart';
import '../../../daily_notes/domain/daily_note.dart';
import '../../../daily_notes/presentation/providers/daily_notes_provider.dart';
import '../../../incidents/presentation/providers/incidents_provider.dart';
import '../../../medication/presentation/providers/medication_provider.dart';
import '../../data/ai_summary_service.dart';

final _timeFormat = DateFormat('HH:mm', 'en_GB');

/// Opens the AI shift summary sheet for [shift] on [now]'s date.
Future<void> showAiSummarySheet(
  BuildContext context, {
  required ShiftType shift,
  required DateTime now,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => AiSummarySheet(shift: shift, now: now),
  );
}

class AiSummarySheet extends ConsumerStatefulWidget {
  const AiSummarySheet({super.key, required this.shift, required this.now});

  final ShiftType shift;
  final DateTime now;

  @override
  ConsumerState<AiSummarySheet> createState() => _AiSummarySheetState();
}

class _AiSummarySheetState extends ConsumerState<AiSummarySheet> {
  String? _summary;
  String? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _generate());
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  /// Compact JSON view of this shift's records — the same provider data and
  /// filters as the handover screen's cards.
  List<Map<String, dynamic>> _buildPayload() {
    final children = ref.read(childrenProvider).valueOrNull ?? [];
    final payload = <Map<String, dynamic>>[];

    for (final child in children) {
      final notes = (ref.read(dailyNotesProvider(child.id)).valueOrNull ?? [])
          .where(
            (n) =>
                n.shift == widget.shift &&
                _isSameDay(n.occurredAt.toUk(), widget.now),
          )
          .toList();
      final behaviour =
          (ref.read(behaviourIncidentsProvider(child.id)).valueOrNull ?? [])
              .where(
                (b) =>
                    b.shift == widget.shift &&
                    _isSameDay(b.occurredAt.toUk(), widget.now),
              )
              .toList();
      final incidents =
          (ref.read(incidentReportsProvider(child.id)).valueOrNull ?? [])
              .where((i) => _isSameDay(i.occurredAt.toUk(), widget.now))
              .toList();
      final admins = (ref.read(todayAdminsProvider(child.id)).valueOrNull ?? [])
          .where((a) => a.shift == widget.shift)
          .toList();
      final baths =
          (ref.read(bathTempTodayProvider(child.id)).valueOrNull ?? [])
              .where((b) => b.shift == widget.shift)
              .toList();

      if (notes.isEmpty &&
          behaviour.isEmpty &&
          incidents.isEmpty &&
          admins.isEmpty &&
          baths.isEmpty) {
        payload.add({'name': child.name, 'noRecordsThisShift': true});
        continue;
      }

      payload.add({
        'name': child.name,
        'notes': [
          for (final n in notes)
            {
              'time': _timeFormat.format(n.occurredAt.toUk()),
              'author': n.authorName,
              'content': n.content,
            },
        ],
        'behaviourIncidents': [
          for (final b in behaviour)
            {
              'time': _timeFormat.format(b.occurredAt.toUk()),
              'severity': b.severity.name,
              'antecedent': b.antecedent,
              'behaviour': b.behaviour,
              'consequence': b.consequence,
              'physicalIntervention': b.physicalIntervention,
              'injuryOccurred': b.injuryOccurred,
            },
        ],
        'incidentReports': [
          for (final i in incidents)
            {
              'time': _timeFormat.format(i.occurredAt.toUk()),
              'type': i.incidentType.name,
              'severity': i.severity.name,
              'title': i.title,
              'description': i.description,
              'immediateAction': i.immediateAction,
            },
        ],
        'medicationAdministrations': [
          for (final a in admins)
            {
              'time': _timeFormat.format(a.administeredAt.toUk()),
              'medication': a.medicationName,
              'dose': a.dose,
              'outcome': a.outcome.name,
              'by': a.administeredByName,
              if (a.reason != null) 'reason': a.reason,
            },
        ],
        'bathTemperatures': [
          for (final b in baths)
            {
              'time': _timeFormat.format(b.recordedAt.toUk()),
              'celsius': b.temperatureCelsius,
            },
        ],
      });
    }
    return payload;
  }

  Future<void> _generate() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final payload = _buildPayload();
    final hasAnyRecords = payload.any((c) => c['noRecordsThisShift'] != true);
    if (!hasAnyRecords) {
      setState(() {
        _loading = false;
        _error = AppStrings.handoverAiNoData;
      });
      return;
    }

    final service = AiSummaryService(
      supabaseClient: ref.read(supabaseClientProvider),
    );
    try {
      final summary = await service.generate(
        date: UkTime.dateStr(widget.now),
        shift: widget.shift.displayName,
        children: payload,
      );
      if (!mounted) return;
      setState(() {
        _summary = summary;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString().replaceFirst('Bad state: ', '');
        _loading = false;
      });
    }
  }

  Future<void> _copy() async {
    final summary = _summary;
    if (summary == null) return;
    // Copy clean text (no Markdown markers) so it pastes tidily into records,
    // emails, or messages.
    await Clipboard.setData(ClipboardData(text: _markdownToPlainText(summary)));
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text(AppStrings.handoverAiCopied)));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome, color: AppColors.teal400),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    AppStrings.handoverAiTitle,
                    style: AppTextStyles.h2(colors.onSurface),
                  ),
                ),
                if (_summary != null)
                  IconButton(
                    tooltip: AppStrings.handoverAiCopy,
                    icon: const Icon(Icons.copy_outlined),
                    onPressed: _copy,
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              AppStrings.handoverAiDisclaimer,
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: _loading
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            AppStrings.handoverAiGenerating,
                            style: AppTextStyles.body(colors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    )
                  : _error != null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 40,
                            color: colors.error,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            _error!,
                            style: AppTextStyles.body(colors.onSurface),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          FilledButton(
                            onPressed: _generate,
                            child: const Text(AppStrings.retry),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      controller: scrollController,
                      child: _MarkdownBody(
                        markdown: _summary ?? '',
                        baseStyle: AppTextStyles.body(colors.onSurface),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Lightweight Markdown rendering ───────────────────────────────────────────
//
// The AI brief comes back as Markdown (bold child names, bullet points, the odd
// heading). We render the small subset Claude actually uses rather than pull in
// a full Markdown package — keeps the dependency surface and build risk down.

/// Matches the inline Markdown emphasis tokens we support, longest-first so
/// `**bold**` wins over `*italic*` at the same position.
final _inlineToken = RegExp(
  r'\*\*(.+?)\*\*|__(.+?)__|\*(.+?)\*|_(.+?)_|`(.+?)`',
);

final _bulletLine = RegExp(r'^\s*[-*•]\s+(.*)$');
final _numberedLine = RegExp(r'^\s*(\d+)[.)]\s+(.*)$');
final _headingLine = RegExp(r'^\s{0,3}(#{1,6})\s+(.*)$');
final _ruleLine = RegExp(r'^\s*([-*_])\1{2,}\s*$');

/// Parses [text] into styled spans, turning `**bold**`, `*italic*`/`_italic_`,
/// and `` `code` `` into the matching [TextStyle] tweaks.
List<TextSpan> _inlineSpans(String text, TextStyle base) {
  final spans = <TextSpan>[];
  var index = 0;
  for (final m in _inlineToken.allMatches(text)) {
    if (m.start > index) {
      spans.add(TextSpan(text: text.substring(index, m.start), style: base));
    }
    final bold = m.group(1) ?? m.group(2);
    final italic = m.group(3) ?? m.group(4);
    final code = m.group(5);
    if (bold != null) {
      spans.add(
        TextSpan(
          text: bold,
          style: base.copyWith(fontWeight: FontWeight.w700),
        ),
      );
    } else if (italic != null) {
      spans.add(
        TextSpan(
          text: italic,
          style: base.copyWith(fontStyle: FontStyle.italic),
        ),
      );
    } else if (code != null) {
      spans.add(
        TextSpan(
          text: code,
          style: base.copyWith(fontFamily: 'monospace'),
        ),
      );
    }
    index = m.end;
  }
  if (index < text.length) {
    spans.add(TextSpan(text: text.substring(index), style: base));
  }
  return spans;
}

/// Strips Markdown markers to plain text (for the clipboard).
String _markdownToPlainText(String md) {
  String stripInline(String s) => s
      .replaceAllMapped(RegExp(r'\*\*(.+?)\*\*'), (m) => m[1]!)
      .replaceAllMapped(RegExp(r'__(.+?)__'), (m) => m[1]!)
      .replaceAllMapped(RegExp(r'\*(.+?)\*'), (m) => m[1]!)
      .replaceAllMapped(RegExp(r'_(.+?)_'), (m) => m[1]!)
      .replaceAllMapped(RegExp(r'`(.+?)`'), (m) => m[1]!);

  return md
      .split('\n')
      .map((line) {
        if (_ruleLine.hasMatch(line)) return '';
        final heading = _headingLine.firstMatch(line);
        if (heading != null) return stripInline(heading.group(2)!.trim());
        final bullet = _bulletLine.firstMatch(line);
        if (bullet != null) return '• ${stripInline(bullet.group(1)!.trim())}';
        return stripInline(line);
      })
      .join('\n');
}

class _MarkdownBody extends StatelessWidget {
  const _MarkdownBody({required this.markdown, required this.baseStyle});

  final String markdown;
  final TextStyle baseStyle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final children = <Widget>[];

    for (final rawLine in markdown.split('\n')) {
      final line = rawLine.trimRight();

      if (line.trim().isEmpty) {
        children.add(const SizedBox(height: AppSpacing.sm));
        continue;
      }

      if (_ruleLine.hasMatch(line)) {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(height: 1, color: colors.outlineVariant),
          ),
        );
        continue;
      }

      final heading = _headingLine.firstMatch(line);
      if (heading != null) {
        final level = heading.group(1)!.length;
        final style = baseStyle.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: (baseStyle.fontSize ?? 15) + (level <= 2 ? 3 : 1),
          height: 1.3,
        );
        children.add(
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: SelectableText.rich(
              TextSpan(children: _inlineSpans(heading.group(2)!.trim(), style)),
            ),
          ),
        );
        continue;
      }

      final bullet = _bulletLine.firstMatch(line);
      final numbered = bullet == null ? _numberedLine.firstMatch(line) : null;
      if (bullet != null || numbered != null) {
        final marker = bullet != null ? '•' : '${numbered!.group(1)}.';
        final content = (bullet?.group(1) ?? numbered!.group(2)!).trim();
        children.add(
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20, child: Text(marker, style: baseStyle)),
                Expanded(
                  child: SelectableText.rich(
                    TextSpan(children: _inlineSpans(content, baseStyle)),
                  ),
                ),
              ],
            ),
          ),
        );
        continue;
      }

      // Plain paragraph.
      children.add(
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: SelectableText.rich(
            TextSpan(children: _inlineSpans(line, baseStyle)),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

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
          .where((n) =>
              n.shift == widget.shift &&
              _isSameDay(n.occurredAt.toUk(), widget.now))
          .toList();
      final behaviour =
          (ref.read(behaviourIncidentsProvider(child.id)).valueOrNull ?? [])
              .where((b) =>
                  b.shift == widget.shift &&
                  _isSameDay(b.occurredAt.toUk(), widget.now))
              .toList();
      final incidents =
          (ref.read(incidentReportsProvider(child.id)).valueOrNull ?? [])
              .where((i) => _isSameDay(i.occurredAt.toUk(), widget.now))
              .toList();
      final admins = (ref.read(todayAdminsProvider(child.id)).valueOrNull ??
              [])
          .where((a) => a.shift == widget.shift)
          .toList();
      final baths = (ref.read(bathTempTodayProvider(child.id)).valueOrNull ??
              [])
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
    final hasAnyRecords =
        payload.any((c) => c['noRecordsThisShift'] != true);
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
    await Clipboard.setData(ClipboardData(text: summary));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(AppStrings.handoverAiCopied)),
    );
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
                            style:
                                AppTextStyles.body(colors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    )
                  : _error != null
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.error_outline,
                                  size: 40, color: colors.error),
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
                          child: SelectableText(
                            _summary ?? '',
                            style: AppTextStyles.body(colors.onSurface),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

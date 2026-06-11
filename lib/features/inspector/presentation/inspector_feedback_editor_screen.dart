import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/inspector_feedback.dart';
import '../domain/inspector_module.dart';
import 'providers/inspector_provider.dart';

/// Lets an inspector leave a compliment, recommendation, or requirement
/// against the granted home, optionally tied to a specific child.
class InspectorFeedbackEditorScreen extends ConsumerStatefulWidget {
  const InspectorFeedbackEditorScreen({super.key, required this.grantId});

  final String grantId;

  @override
  ConsumerState<InspectorFeedbackEditorScreen> createState() =>
      _InspectorFeedbackEditorScreenState();
}

class _InspectorFeedbackEditorScreenState
    extends ConsumerState<InspectorFeedbackEditorScreen> {
  final _contentController = TextEditingController();
  InspectorModule? _module;
  String? _childId;
  FeedbackSeverity _severity = FeedbackSeverity.recommendation;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Color _severityColor(FeedbackSeverity severity) => switch (severity) {
        FeedbackSeverity.compliment => AppColors.green,
        FeedbackSeverity.recommendation => AppColors.blue,
        FeedbackSeverity.requirement => AppColors.red,
      };

  IconData _severityIcon(FeedbackSeverity severity) => switch (severity) {
        FeedbackSeverity.compliment => Icons.thumb_up_outlined,
        FeedbackSeverity.recommendation => Icons.lightbulb_outline,
        FeedbackSeverity.requirement => Icons.warning_amber_outlined,
      };

  Future<void> _submit({
    required String homeId,
    required List<Map<String, dynamic>> children,
  }) async {
    final module = _module;
    final content = _contentController.text.trim();
    if (module == null) return;
    if (content.isEmpty) {
      setState(() => _error = AppStrings.inspectorFeedbackEmpty);
      return;
    }

    setState(() {
      _submitting = true;
      _error = null;
    });

    String? childName;
    if (_childId != null) {
      for (final child in children) {
        if (child['id'] == _childId) {
          childName = child['name'] as String?;
          break;
        }
      }
    }

    try {
      final feedback =
          await ref.read(inspectorFeedbackRepositoryProvider).submitFeedback(
                homeId: homeId,
                module: module,
                severity: _severity,
                content: content,
                childId: _childId,
                childName: childName,
              );
      await ref
          .read(inspectorAuditServiceProvider)
          .recordFeedbackSubmitted(feedback);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.inspectorFeedbackSubmitted)),
      );
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final grantAsync = ref.watch(grantByIdProvider(widget.grantId));

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inspectorFeedbackTitle)),
      body: grantAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(message: e.toString()),
        data: (grant) {
          if (grant == null) {
            return const ErrorView(message: AppStrings.inspectorExpired);
          }

          final modules = [
            for (final scopeKey in grant.scope)
              if (InspectorModule.fromScopeKey(scopeKey) case final m?) m,
          ];
          _module ??= modules.isNotEmpty ? modules.first : null;

          final childrenAsync =
              ref.watch(inspectorChildrenProvider(grant.homeId));
          final children = childrenAsync.valueOrNull ?? const [];

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(AppStrings.inspectorFeedbackModuleLabel,
                  style: AppTextStyles.label(colors.onSurfaceVariant)),
              const SizedBox(height: AppSpacing.xs),
              DropdownButtonFormField<InspectorModule>(
                initialValue: _module,
                isExpanded: true,
                items: [
                  for (final m in modules)
                    DropdownMenuItem(value: m, child: Text(m.displayName)),
                ],
                onChanged: (v) => setState(() => _module = v),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(AppStrings.inspectorFeedbackChildLabel,
                  style: AppTextStyles.label(colors.onSurfaceVariant)),
              const SizedBox(height: AppSpacing.xs),
              DropdownButtonFormField<String?>(
                initialValue: _childId,
                isExpanded: true,
                items: [
                  const DropdownMenuItem<String?>(
                    value: null,
                    child: Text(AppStrings.inspectorFeedbackChildNone),
                  ),
                  for (final child in children)
                    DropdownMenuItem<String?>(
                      value: child['id'] as String,
                      child: Text(child['name'] as String? ?? ''),
                    ),
                ],
                onChanged: (v) => setState(() => _childId = v),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(AppStrings.inspectorFeedbackSeverityLabel,
                  style: AppTextStyles.label(colors.onSurfaceVariant)),
              const SizedBox(height: AppSpacing.xs),
              SegmentedButton<FeedbackSeverity>(
                segments: [
                  for (final severity in FeedbackSeverity.values)
                    ButtonSegment(
                      value: severity,
                      label: Text(severity.displayName),
                      icon: Icon(_severityIcon(severity),
                          color: _severityColor(severity)),
                    ),
                ],
                selected: {_severity},
                onSelectionChanged: (s) =>
                    setState(() => _severity = s.first),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(AppStrings.inspectorFeedbackContentLabel,
                  style: AppTextStyles.label(colors.onSurfaceVariant)),
              const SizedBox(height: AppSpacing.xs),
              TextField(
                controller: _contentController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: AppStrings.inspectorFeedbackContentHint,
                  border: OutlineInputBorder(),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(_error!, style: AppTextStyles.small(colors.error)),
              ],
              const SizedBox(height: AppSpacing.xl),
              FilledButton(
                onPressed: _submitting
                    ? null
                    : () => _submit(homeId: grant.homeId, children: children),
                child: _submitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(AppStrings.inspectorFeedbackSubmit),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/time/uk_time.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../auth/presentation/providers/auth_provider.dart';
import '../domain/inspector_feedback.dart';
import '../domain/inspector_grant.dart';
import '../domain/inspector_module.dart';
import 'providers/inspector_provider.dart';
import 'widgets/grant_form_sheet.dart';

final _dateFormat = DateFormat('d MMM yyyy', 'en_GB');

/// Manager screen for granting/revoking inspector access to this home and
/// reviewing feedback inspectors have left.
class ManagerInspectorAccessScreen extends ConsumerStatefulWidget {
  const ManagerInspectorAccessScreen({super.key});

  @override
  ConsumerState<ManagerInspectorAccessScreen> createState() =>
      _ManagerInspectorAccessScreenState();
}

class _ManagerInspectorAccessScreenState
    extends ConsumerState<ManagerInspectorAccessScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeId = ref.watch(currentUserProvider)?.homeId ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.managerInspectorAccessTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: AppStrings.managerInspectorAccessTabGrants),
            Tab(text: AppStrings.managerInspectorAccessTabFeedback),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _GrantsTab(homeId: homeId),
          _FeedbackTab(homeId: homeId),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton.extended(
              onPressed: () => showGrantFormSheet(context, homeId: homeId),
              icon: const Icon(Icons.add),
              label: const Text(AppStrings.managerNewGrant),
            )
          : null,
    );
  }
}

// ── Access tab ───────────────────────────────────────────────────────────

class _GrantsTab extends ConsumerWidget {
  const _GrantsTab({required this.homeId});

  final String homeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grantsAsync = ref.watch(grantsForHomeProvider(homeId));
    final colors = Theme.of(context).colorScheme;

    return grantsAsync.when(
      loading: () => const LoadingSkeleton(),
      error: (e, _) => ErrorView(
        message: e.toString(),
        onRetry: () => ref.invalidate(grantsForHomeProvider(homeId)),
      ),
      data: (grants) {
        if (grants.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.fact_check_outlined,
                      size: 56, color: colors.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.managerNoGrants,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: grants.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (_, i) => _GrantTile(grant: grants[i], homeId: homeId),
        );
      },
    );
  }
}

class _GrantTile extends ConsumerWidget {
  const _GrantTile({required this.grant, required this.homeId});

  final InspectorGrant grant;
  final String homeId;

  Future<void> _confirmRevoke(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.managerRevokeGrantTitle),
        content: const Text(AppStrings.managerRevokeGrantConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(dialogContext).colorScheme.error),
            child: const Text(AppStrings.managerRevokeGrant),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(inspectorGrantsRepositoryProvider).revokeGrant(grant.id);
      ref.invalidate(grantsForHomeProvider(homeId));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final isActive = grant.isActive;
    final modules = [
      for (final scopeKey in grant.scope)
        if (InspectorModule.fromScopeKey(scopeKey) case final m?) m,
    ];

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person_outline, color: AppColors.roleInspector),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    grant.inspectorEmail ?? grant.inspectorUserId,
                    style: AppTextStyles.h3(colors.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _Badge(
                  label: isActive
                      ? AppStrings.managerGrantActive
                      : AppStrings.managerGrantExpired,
                  color: isActive ? AppColors.green : AppColors.slate400,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${AppStrings.managerGrantExpiresPrefix} '
              '${_dateFormat.format(grant.expiresAt.toUk())}',
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final module in modules)
                  _Badge(label: module.displayName, color: AppColors.blue),
              ],
            ),
            if (isActive) ...[
              const SizedBox(height: AppSpacing.sm),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _confirmRevoke(context, ref),
                  style: TextButton.styleFrom(foregroundColor: colors.error),
                  child: const Text(AppStrings.managerRevokeGrant),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Feedback tab ─────────────────────────────────────────────────────────

class _FeedbackTab extends ConsumerWidget {
  const _FeedbackTab({required this.homeId});

  final String homeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackAsync = ref.watch(feedbackForHomeProvider(homeId));
    final colors = Theme.of(context).colorScheme;

    return feedbackAsync.when(
      loading: () => const LoadingSkeleton(),
      error: (e, _) => ErrorView(
        message: e.toString(),
        onRetry: () => ref.invalidate(feedbackForHomeProvider(homeId)),
      ),
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.rate_review_outlined,
                      size: 56, color: colors.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.managerNoFeedback,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (_, i) => _FeedbackTile(feedback: items[i], homeId: homeId),
        );
      },
    );
  }
}

class _FeedbackTile extends ConsumerWidget {
  const _FeedbackTile({required this.feedback, required this.homeId});

  final InspectorFeedback feedback;
  final String homeId;

  Color _severityColor(FeedbackSeverity severity) => switch (severity) {
        FeedbackSeverity.compliment => AppColors.green,
        FeedbackSeverity.recommendation => AppColors.blue,
        FeedbackSeverity.requirement => AppColors.red,
      };

  Color _statusColor(FeedbackStatus status) => switch (status) {
        FeedbackStatus.open => AppColors.amber,
        FeedbackStatus.acknowledged => AppColors.blue,
        FeedbackStatus.resolved => AppColors.green,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final module = InspectorModule.fromScopeKey(feedback.module);

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: feedback.status == FeedbackStatus.resolved
            ? null
            : () => _showStatusSheet(context, ref),
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Badge(
                      label: feedback.severity.displayName,
                      color: _severityColor(feedback.severity)),
                  const SizedBox(width: AppSpacing.sm),
                  _Badge(
                      label: feedback.status.displayName,
                      color: _statusColor(feedback.status)),
                  const Spacer(),
                  Text(_dateFormat.format(feedback.createdAt.toUk()),
                      style: AppTextStyles.small(colors.onSurfaceVariant)),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                module?.displayName ?? feedback.module,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              if (feedback.childName != null)
                Text(feedback.childName!,
                    style: AppTextStyles.small(colors.onSurfaceVariant)),
              const SizedBox(height: AppSpacing.xs),
              Text(feedback.content, style: AppTextStyles.body(colors.onSurface)),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '${AppStrings.managerFeedbackFrom} ${feedback.inspectorEmail}',
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
              if (feedback.resolutionNotes != null &&
                  feedback.resolutionNotes!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.input),
                  ),
                  child: Text(feedback.resolutionNotes!,
                      style: AppTextStyles.small(colors.onSurface)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showStatusSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _FeedbackStatusSheet(feedback: feedback, homeId: homeId),
    );
  }
}

class _FeedbackStatusSheet extends ConsumerStatefulWidget {
  const _FeedbackStatusSheet({required this.feedback, required this.homeId});

  final InspectorFeedback feedback;
  final String homeId;

  @override
  ConsumerState<_FeedbackStatusSheet> createState() =>
      _FeedbackStatusSheetState();
}

class _FeedbackStatusSheetState extends ConsumerState<_FeedbackStatusSheet> {
  final _notesController = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _update(FeedbackStatus status) async {
    setState(() => _submitting = true);
    try {
      await ref.read(inspectorFeedbackRepositoryProvider).updateStatus(
            widget.feedback.id,
            status,
            resolutionNotes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          );
      ref.invalidate(feedbackForHomeProvider(widget.homeId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerFeedbackUpdated)),
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: AppSpacing.lg + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.feedback.content, style: AppTextStyles.body(colors.onSurface)),
          const SizedBox(height: AppSpacing.lg),
          Text(AppStrings.managerFeedbackResolutionLabel,
              style: AppTextStyles.label(colors.onSurfaceVariant)),
          const SizedBox(height: AppSpacing.xs),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              if (widget.feedback.status == FeedbackStatus.open)
                Expanded(
                  child: OutlinedButton(
                    onPressed: _submitting
                        ? null
                        : () => _update(FeedbackStatus.acknowledged),
                    child: const Text(AppStrings.managerFeedbackAcknowledge),
                  ),
                ),
              if (widget.feedback.status == FeedbackStatus.open)
                const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: FilledButton(
                  onPressed:
                      _submitting ? null : () => _update(FeedbackStatus.resolved),
                  child: _submitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(AppStrings.managerFeedbackResolve),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm, vertical: 2),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(label, style: AppTextStyles.label(color)),
      );
}

import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../shared/errors/friendly_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/models/app_strings.dart';
import '../../data/parent_links_repository.dart';
import '../providers/parent_portal_provider.dart';

/// Opens the "Link Parent to Child" bottom sheet for [homeId].
Future<void> showLinkFormSheet(BuildContext context, {required String homeId}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => LinkFormSheet(homeId: homeId),
  );
}

class LinkFormSheet extends ConsumerStatefulWidget {
  const LinkFormSheet({super.key, required this.homeId});

  final String homeId;

  @override
  ConsumerState<LinkFormSheet> createState() => _LinkFormSheetState();
}

class _LinkFormSheetState extends ConsumerState<LinkFormSheet> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  String _query = '';
  ParentAccount? _selected;
  String? _childId;
  bool _canViewPhotos = false;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      setState(() {
        _query = value.trim();
        _selected = null;
      });
    });
  }

  Future<void> _submit() async {
    final selected = _selected;
    final childId = _childId;
    if (selected == null || childId == null) return;

    setState(() {
      _submitting = true;
      _error = null;
    });

    try {
      await ref
          .read(parentLinksRepositoryProvider)
          .createLink(
            parentUserId: selected.id,
            childId: childId,
            homeId: widget.homeId,
            canViewPhotos: _canViewPhotos,
          );
      ref.invalidate(parentLinksForHomeProvider(widget.homeId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerParentLinkCreated)),
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = friendlyError(e));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final searchAsync = _query.isEmpty
        ? const AsyncValue<List<ParentAccount>>.data([])
        : ref.watch(parentSearchProvider(_query));
    final childrenAsync = ref.watch(parentFormChildrenProvider(widget.homeId));

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: AppSpacing.lg + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.managerParentLinkFormTitle,
              style: AppTextStyles.h2(colors.onSurface),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.managerParentLinkFormSearchLabel,
              style: AppTextStyles.label(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.xs),
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: const InputDecoration(
                hintText: AppStrings.managerParentLinkFormSearchHint,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            if (_selected != null)
              _Badge(label: _selected!.email, color: AppColors.roleParent)
            else if (_query.isNotEmpty)
              searchAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: LinearProgressIndicator(),
                ),
                error: (e, _) => Text(
                  e.toString(),
                  style: AppTextStyles.small(colors.error),
                ),
                data: (results) {
                  if (results.isEmpty) {
                    return Text(
                      AppStrings.managerParentLinkFormNoResults,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    );
                  }
                  return Column(
                    children: [
                      for (final account in results)
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.person_outline),
                          title: Text(account.email),
                          onTap: () => setState(() {
                            _selected = account;
                            _searchController.text = account.email;
                          }),
                        ),
                    ],
                  );
                },
              ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.managerParentLinkFormChildLabel,
              style: AppTextStyles.label(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.xs),
            childrenAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (e, _) =>
                  Text(e.toString(), style: AppTextStyles.small(colors.error)),
              data: (children) => DropdownButtonFormField<String>(
                initialValue: _childId,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: [
                  for (final child in children)
                    DropdownMenuItem(
                      value: child['id'] as String,
                      child: Text(child['name'] as String? ?? ''),
                    ),
                ],
                onChanged: (value) => setState(() => _childId = value),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(AppStrings.managerParentLinkFormPhotosLabel),
              subtitle: Text(
                AppStrings.managerParentLinkFormPhotosHint,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
              value: _canViewPhotos,
              onChanged: (value) => setState(() => _canViewPhotos = value),
            ),
            if (_error != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(_error!, style: AppTextStyles.small(colors.error)),
            ],
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: (_selected == null || _childId == null || _submitting)
                  ? null
                  : _submit,
              child: _submitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text(AppStrings.managerParentLinkFormSubmit),
            ),
          ],
        ),
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
      horizontal: AppSpacing.sm,
      vertical: AppSpacing.xs,
    ),
    decoration: BoxDecoration(
      color: color.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.pill),
      border: Border.all(color: color.withAlpha(60)),
    ),
    child: Text(label, style: AppTextStyles.label(color)),
  );
}

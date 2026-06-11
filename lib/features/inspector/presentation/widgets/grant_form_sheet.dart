import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/models/app_strings.dart';
import '../../data/inspector_grants_repository.dart';
import '../../domain/inspector_module.dart';
import '../providers/inspector_provider.dart';

/// Opens the "Grant Inspector Access" bottom sheet for [homeId].
Future<void> showGrantFormSheet(
  BuildContext context, {
  required String homeId,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => GrantFormSheet(homeId: homeId),
  );
}

class GrantFormSheet extends ConsumerStatefulWidget {
  const GrantFormSheet({super.key, required this.homeId});

  final String homeId;

  @override
  ConsumerState<GrantFormSheet> createState() => _GrantFormSheetState();
}

class _GrantFormSheetState extends ConsumerState<GrantFormSheet> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  String _query = '';
  InspectorAccount? _selected;
  final Set<InspectorModule> _scope = {};
  DateTime _expiresAt = DateTime.now().add(const Duration(days: 7));
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

  Future<void> _pickExpiry() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expiresAt,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _expiresAt = picked);
    }
  }

  Future<void> _submit() async {
    final selected = _selected;
    if (selected == null || _scope.isEmpty) return;

    setState(() {
      _submitting = true;
      _error = null;
    });

    // The picker returns midnight at the start of the day — extend to the
    // end of the selected day so the grant covers the whole expiry date.
    final endOfDay = DateTime(
      _expiresAt.year,
      _expiresAt.month,
      _expiresAt.day,
      23,
      59,
      59,
    );

    try {
      await ref.read(inspectorGrantsRepositoryProvider).createGrant(
            inspectorUserId: selected.id,
            homeId: widget.homeId,
            expiresAt: endOfDay,
            scope: _scope.map((m) => m.scopeKey).toList(),
          );
      ref.invalidate(grantsForHomeProvider(widget.homeId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerGrantCreated)),
      );
      Navigator.of(context).pop();
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
    final searchAsync = _query.isEmpty
        ? const AsyncValue<List<InspectorAccount>>.data([])
        : ref.watch(inspectorSearchProvider(_query));

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
            Text(AppStrings.managerGrantFormTitle,
                style: AppTextStyles.h2(colors.onSurface)),
            const SizedBox(height: AppSpacing.lg),
            Text(AppStrings.managerGrantFormSearchLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.xs),
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: const InputDecoration(
                hintText: AppStrings.managerGrantFormSearchHint,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            if (_selected != null)
              _Badge(label: _selected!.email, color: AppColors.roleInspector)
            else if (_query.isNotEmpty)
              searchAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: LinearProgressIndicator(),
                ),
                error: (e, _) => Text(e.toString(),
                    style: AppTextStyles.small(colors.error)),
                data: (results) {
                  if (results.isEmpty) {
                    return Text(AppStrings.managerGrantFormNoResults,
                        style: AppTextStyles.small(colors.onSurfaceVariant));
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
            Text(AppStrings.managerGrantFormScopeLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final module in InspectorModule.values)
                  FilterChip(
                    label: Text(module.displayName),
                    selected: _scope.contains(module),
                    onSelected: (selected) => setState(() {
                      if (selected) {
                        _scope.add(module);
                      } else {
                        _scope.remove(module);
                      }
                    }),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(AppStrings.managerGrantFormExpiryLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.xs),
            OutlinedButton.icon(
              onPressed: _pickExpiry,
              icon: const Icon(Icons.event_outlined),
              label: Text(DateFormat('d MMM yyyy', 'en_GB').format(_expiresAt)),
            ),
            if (_error != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(_error!, style: AppTextStyles.small(colors.error)),
            ],
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: (_selected == null || _scope.isEmpty || _submitting)
                  ? null
                  : _submit,
              child: _submitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text(AppStrings.managerGrantFormSubmit),
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
            horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(color: color.withAlpha(60)),
        ),
        child: Text(label, style: AppTextStyles.label(color)),
      );
}

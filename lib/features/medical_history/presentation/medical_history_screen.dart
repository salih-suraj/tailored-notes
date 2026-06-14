import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/healthcare_contact.dart';
import '../domain/medical_profile.dart';
import 'providers/medical_history_provider.dart';

class MedicalHistoryScreen extends ConsumerWidget {
  const MedicalHistoryScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(medicalProfileProvider(childId));
    final contactsAsync = ref.watch(healthcareContactsProvider(childId));
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;

    final childName =
        childrenAsync.valueOrNull
            ?.where((c) => c.id == childId)
            .firstOrNull
            ?.name ??
        '';

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.medHistoryTitle),
            if (childName.isNotEmpty)
              Text(
                childName,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.push(
              '/children/$childId/medical-history/edit',
              extra: profileAsync.valueOrNull,
            ),
            child: Text(
              AppStrings.edit,
              style: AppTextStyles.button(colors.primary),
            ),
          ),
        ],
      ),
      body: switch ((profileAsync, contactsAsync)) {
        (AsyncError(:final error), _) ||
        (_, AsyncError(:final error)) => ErrorView(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(medicalProfileProvider(childId));
            ref.invalidate(healthcareContactsProvider(childId));
          },
        ),
        (AsyncLoading(), _) || (_, AsyncLoading()) => const LoadingSkeleton(),
        (AsyncData(value: final profile), AsyncData(value: final contacts)) =>
          _MedHistoryBody(
            childId: childId,
            profile: profile,
            contacts: contacts,
          ),
        _ => const LoadingSkeleton(),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showContactSheet(context, ref),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.person_add_outlined),
        label: const Text(AppStrings.medHistoryAddContact),
      ),
    );
  }

  Future<void> _showContactSheet(
    BuildContext context,
    WidgetRef ref, {
    HealthcareContact? contact,
  }) => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _ContactSheet(childId: childId, existing: contact),
  );
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _MedHistoryBody extends ConsumerWidget {
  const _MedHistoryBody({
    required this.childId,
    required this.profile,
    required this.contacts,
  });

  final String childId;
  final MedicalProfile? profile;
  final List<HealthcareContact> contacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    if (profile == null && contacts.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.health_and_safety_outlined,
              size: 56,
              color: colors.onSurfaceVariant,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.medHistoryEmpty,
              style: AppTextStyles.body(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              AppStrings.medHistoryEmptyHint,
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        // ── Allergies — critical, shown first ──────────────────────────
        if (profile?.allergies != null && profile!.allergies!.isNotEmpty) ...[
          _AllergyBanner(allergies: profile!.allergies!),
          const SizedBox(height: AppSpacing.lg),
        ],

        // ── Key identifiers ────────────────────────────────────────────
        if (profile != null) ...[
          const _SectionHeader(AppStrings.medHistoryKeyInfo),
          const SizedBox(height: AppSpacing.sm),
          _InfoCard(
            children: [
              if (profile!.nhsNumber != null)
                _InfoRow(
                  label: AppStrings.medHistoryNhs,
                  value: profile!.nhsNumber!,
                  copyable: true,
                ),
              if (profile!.bloodType != null)
                _InfoRow(
                  label: AppStrings.medHistoryBloodType,
                  value: profile!.bloodType!,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
        ],

        // ── Conditions ─────────────────────────────────────────────────
        if (profile?.conditions != null && profile!.conditions!.isNotEmpty) ...[
          const _SectionHeader(AppStrings.medHistoryConditions),
          const SizedBox(height: AppSpacing.sm),
          _InfoCard(
            children: [
              Text(
                profile!.conditions!,
                style: AppTextStyles.body(
                  Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
        ],

        // ── Healthcare contacts ────────────────────────────────────────
        if (contacts.isNotEmpty) ...[
          const _SectionHeader(AppStrings.medHistoryContacts),
          const SizedBox(height: AppSpacing.sm),
          ...contacts.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _ContactCard(
                contact: c,
                onEdit: () => showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => _ContactSheet(childId: childId, existing: c),
                ),
                onDelete: () => _confirmDelete(context, ref, c.id),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],

        // ── Immunisations ──────────────────────────────────────────────
        if (profile?.immunisationNotes != null &&
            profile!.immunisationNotes!.isNotEmpty) ...[
          const _SectionHeader(AppStrings.medHistoryImmunisation),
          const SizedBox(height: AppSpacing.sm),
          _InfoCard(
            children: [
              Text(
                profile!.immunisationNotes!,
                style: AppTextStyles.body(
                  Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
        ],

        // ── Notes ──────────────────────────────────────────────────────
        if (profile?.notes != null && profile!.notes!.isNotEmpty) ...[
          const _SectionHeader(AppStrings.medHistoryNotes),
          const SizedBox(height: AppSpacing.sm),
          _InfoCard(
            children: [
              Text(
                profile!.notes!,
                style: AppTextStyles.body(
                  Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ],

        const SizedBox(height: 80),
      ],
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.medHistoryDeleteContact),
        content: const Text(AppStrings.medHistoryDeleteContactConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(medicalHistoryRepositoryProvider).deleteContact(id);
    }
  }
}

// ── Allergy banner ────────────────────────────────────────────────────────────

class _AllergyBanner extends StatelessWidget {
  const _AllergyBanner({required this.allergies});
  final String allergies;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppSpacing.lg),
    decoration: BoxDecoration(
      color: AppColors.red.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.card),
      border: Border.all(color: AppColors.red.withAlpha(80)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.warning_amber_rounded, color: AppColors.red, size: 20),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.medHistoryAllergies,
                style: AppTextStyles.label(AppColors.red),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(allergies, style: AppTextStyles.body(AppColors.red)),
            ],
          ),
        ),
      ],
    ),
  );
}

// ── Contact card ──────────────────────────────────────────────────────────────

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.contact,
    required this.onEdit,
    required this.onDelete,
  });

  final HealthcareContact contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onEdit,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blue.withAlpha(25),
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                          child: Text(
                            contact.contactType.displayName,
                            style: AppTextStyles.label(AppColors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      contact.name,
                      style: AppTextStyles.h3(colors.onSurface),
                    ),
                    if (contact.role != null)
                      Text(
                        contact.role!,
                        style: AppTextStyles.small(colors.onSurfaceVariant),
                      ),
                    if (contact.phone != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      GestureDetector(
                        onTap: () => Clipboard.setData(
                          ClipboardData(text: contact.phone!),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 14,
                              color: colors.primary,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              contact.phone!,
                              style: AppTextStyles.body(colors.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  size: 18,
                  color: colors.onSurfaceVariant,
                ),
                tooltip: AppStrings.recordOptions,
                onSelected: (v) {
                  if (v == 'edit') onEdit();
                  if (v == 'delete') onDelete();
                },
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text(AppStrings.edit),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text(AppStrings.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Shared widgets ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.label);
  final String label;

  @override
  Widget build(BuildContext context) => Text(
    label,
    style: AppTextStyles.label(Theme.of(context).colorScheme.onSurfaceVariant),
  );
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppSpacing.lg),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.copyable = false,
  });
  final String label;
  final String value;
  final bool copyable;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Text('$label: ', style: AppTextStyles.small(colors.onSurfaceVariant)),
          if (copyable)
            GestureDetector(
              onTap: () => Clipboard.setData(ClipboardData(text: value)),
              child: Text(value, style: AppTextStyles.body(colors.primary)),
            )
          else
            Text(value, style: AppTextStyles.body(colors.onSurface)),
        ],
      ),
    );
  }
}

// ── Contact bottom sheet ──────────────────────────────────────────────────────

class _ContactSheet extends ConsumerStatefulWidget {
  const _ContactSheet({required this.childId, this.existing});

  final String childId;
  final HealthcareContact? existing;

  @override
  ConsumerState<_ContactSheet> createState() => _ContactSheetState();
}

class _ContactSheetState extends ConsumerState<_ContactSheet> {
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  ContactType _type = ContactType.gp;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final c = widget.existing;
    if (c != null) {
      _nameController.text = c.name;
      _roleController.text = c.role ?? '';
      _phoneController.text = c.phone ?? '';
      _emailController.text = c.email ?? '';
      _addressController.text = c.address ?? '';
      _notesController.text = c.notes ?? '';
      _type = c.contactType;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.medHistoryNameRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final contact = HealthcareContact(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        contactType: _type,
        name: name,
        role: _roleController.text.trim().isEmpty
            ? null
            : _roleController.text.trim(),
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        email: _emailController.text.trim().isEmpty
            ? null
            : _emailController.text.trim(),
        address: _addressController.text.trim().isEmpty
            ? null
            : _addressController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(medicalHistoryRepositoryProvider).saveContact(contact);
      if (mounted) Navigator.of(context).pop();
    } catch (e, st) {
      log(
        'Contact save failed',
        error: e,
        stackTrace: st,
        name: 'ContactSheet',
      );
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text(AppStrings.saveFailed)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isEditing = widget.existing != null;

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  isEditing
                      ? AppStrings.medHistoryEditContact
                      : AppStrings.medHistoryAddContact,
                  style: AppTextStyles.h3(colors.onSurface),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: AppStrings.cancel,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Type chips
            Text(
              AppStrings.medHistoryContactType,
              style: AppTextStyles.label(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: ContactType.values.map((t) {
                final sel = _type == t;
                return FilterChip(
                  label: Text(t.displayName),
                  selected: sel,
                  onSelected: (_) => setState(() => _type = t),
                  selectedColor: colors.primaryContainer,
                  checkmarkColor: colors.primary,
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.lg),

            _SheetField(
              AppStrings.medHistoryContactName,
              _nameController,
              autofocus: true,
            ),
            const SizedBox(height: AppSpacing.md),
            _SheetField(AppStrings.medHistoryContactRole, _roleController),
            const SizedBox(height: AppSpacing.md),
            _SheetField(
              AppStrings.medHistoryContactPhone,
              _phoneController,
              keyboard: TextInputType.phone,
            ),
            const SizedBox(height: AppSpacing.md),
            _SheetField(
              AppStrings.medHistoryContactEmail,
              _emailController,
              keyboard: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.md),
            _SheetField(
              AppStrings.medHistoryContactAddress,
              _addressController,
              maxLines: 2,
            ),
            const SizedBox(height: AppSpacing.lg),

            FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.teal400,
                minimumSize: const Size.fromHeight(AppTapTarget.min),
              ),
              child: _saving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.white,
                      ),
                    )
                  : const Text(AppStrings.save),
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetField extends StatelessWidget {
  const _SheetField(
    this.label,
    this.controller, {
    this.maxLines = 1,
    this.keyboard = TextInputType.text,
    this.autofocus = false,
  });

  final String label;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboard;
  final bool autofocus;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    maxLines: maxLines,
    keyboardType: keyboard,
    autofocus: autofocus,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
  );
}

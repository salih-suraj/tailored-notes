import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/models/app_strings.dart';
import '../../../auth/domain/user_role.dart';
import '../providers/staff_provider.dart';

/// Opens the "Add Staff Member" bottom sheet for [homeId].
Future<void> showStaffFormSheet(
  BuildContext context, {
  required String homeId,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => StaffFormSheet(homeId: homeId),
  );
}

class StaffFormSheet extends ConsumerStatefulWidget {
  const StaffFormSheet({super.key, required this.homeId});

  final String homeId;

  @override
  ConsumerState<StaffFormSheet> createState() => _StaffFormSheetState();
}

class _StaffFormSheetState extends ConsumerState<StaffFormSheet> {
  // Roles a manager can provision in-app (mirrors the Edge Function allow-list).
  static const _selectableRoles = [
    UserRole.supportWorker,
    UserRole.teamLeader,
    UserRole.manager,
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  UserRole _role = UserRole.supportWorker;
  bool _obscurePassword = true;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();

    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref
          .read(staffRepositoryProvider)
          .createStaff(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            displayName: _nameController.text.trim(),
            role: _role,
          );
      ref.invalidate(staffForHomeProvider(widget.homeId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerStaffCreated)),
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

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: AppSpacing.lg + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.managerStaffFormTitle,
                style: AppTextStyles.h2(colors.onSurface),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Name
              Text(
                AppStrings.managerStaffFormNameLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: AppStrings.managerStaffFormNameHint,
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? AppStrings.managerStaffNameRequired
                    : null,
              ),
              const SizedBox(height: AppSpacing.lg),

              // Email
              Text(
                AppStrings.managerStaffFormEmailLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: AppStrings.managerStaffFormEmailHint,
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return AppStrings.managerStaffEmailRequired;
                  }
                  if (!v.contains('@') || !v.contains('.')) {
                    return AppStrings.managerStaffEmailInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),

              // Role
              Text(
                AppStrings.managerStaffFormRoleLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final role in _selectableRoles)
                    ChoiceChip(
                      label: Text(role.displayName),
                      selected: _role == role,
                      onSelected: (_) => setState(() => _role = role),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // Temporary password
              Text(
                AppStrings.managerStaffFormPasswordLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  hintText: AppStrings.managerStaffFormPasswordHint,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: colors.onSurfaceVariant,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    tooltip: _obscurePassword
                        ? AppStrings.showPassword
                        : AppStrings.hidePassword,
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return AppStrings.managerStaffPasswordRequired;
                  }
                  if (v.length < 8) {
                    return AppStrings.managerStaffPasswordTooShort;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                AppStrings.managerStaffFormPasswordNote,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),

              if (_error != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(_error!, style: AppTextStyles.small(colors.error)),
              ],
              const SizedBox(height: AppSpacing.xl),
              FilledButton(
                onPressed: _submitting ? null : _submit,
                child: _submitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(AppStrings.managerStaffFormSubmit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

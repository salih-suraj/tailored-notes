import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/errors/friendly_error.dart';
import '../../../../shared/models/app_strings.dart';
import '../providers/inspector_provider.dart';

/// Opens the "Add Inspector Account" bottom sheet. Creating the account is
/// separate from granting access — onboard the inspector first, grant them
/// time-boxed access to a home later via the Grant Access form.
Future<void> showInspectorFormSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const InspectorFormSheet(),
  );
}

class InspectorFormSheet extends ConsumerStatefulWidget {
  const InspectorFormSheet({super.key});

  @override
  ConsumerState<InspectorFormSheet> createState() => _InspectorFormSheetState();
}

class _InspectorFormSheetState extends ConsumerState<InspectorFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
          .read(inspectorGrantsRepositoryProvider)
          .createInspectorAccount(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            displayName: _nameController.text.trim(),
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerInspectorCreated)),
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
                AppStrings.managerInspectorFormTitle,
                style: AppTextStyles.h2(colors.onSurface),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Name
              Text(
                AppStrings.managerInspectorFormNameLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: AppStrings.managerInspectorFormNameHint,
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? AppStrings.managerInspectorNameRequired
                    : null,
              ),
              const SizedBox(height: AppSpacing.lg),

              // Email
              Text(
                AppStrings.managerInspectorFormEmailLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: AppStrings.managerInspectorFormEmailHint,
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return AppStrings.managerInspectorEmailRequired;
                  }
                  if (!v.contains('@') || !v.contains('.')) {
                    return AppStrings.managerInspectorEmailInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),

              // Temporary password
              Text(
                AppStrings.managerInspectorFormPasswordLabel,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  hintText: AppStrings.managerInspectorFormPasswordHint,
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
                    return AppStrings.managerInspectorPasswordRequired;
                  }
                  if (v.length < 8) {
                    return AppStrings.managerInspectorPasswordTooShort;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                AppStrings.managerInspectorFormPasswordNote,
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
                    : const Text(AppStrings.managerInspectorFormSubmit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

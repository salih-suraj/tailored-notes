import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_client.dart';
import '../../../core/theme/theme.dart';
import '../../../shared/errors/friendly_error.dart';
import '../../../shared/models/app_strings.dart';

/// Forced password change, shown on first login for accounts a manager
/// provisioned with a temporary password (`must_change_password` set in the
/// auth user's metadata).
///
/// On success it calls `updateUser` to set the new password AND clear the
/// metadata flag in one call. That fires onAuthStateChange → currentUser
/// recomputes with mustChangePassword=false → the router redirects the user on
/// to their role's home. No manual navigation needed.
class SetPasswordScreen extends ConsumerStatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  ConsumerState<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends ConsumerState<SetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;
  bool _saving = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    // Close the keyboard now that the tap has registered.
    FocusScope.of(context).unfocus();
    final client = ref.read(supabaseClientProvider);
    if (client == null) return;

    setState(() => _saving = true);
    try {
      await client.auth.updateUser(
        UserAttributes(
          password: _passwordController.text,
          data: {'must_change_password': false},
        ),
      );
      // Success — the router redirects once currentUser refreshes.
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(AppStrings.setPasswordSuccess)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(friendlyError(e)),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    AppSpacing.xxxl,
                    AppSpacing.xl,
                    AppSpacing.lg,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset('assets/images/logo.png', height: 72),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            AppStrings.appName,
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 28,
                              color: AppColors.teal600,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          Text(
                            AppStrings.setPasswordTitle,
                            style: AppTextStyles.h2(colors.onSurface),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            AppStrings.setPasswordBody,
                            style: AppTextStyles.body(colors.onSurfaceVariant),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.xl),

                          // New password
                          Text(
                            AppStrings.setPasswordNewLabel,
                            style: AppTextStyles.label(colors.onSurfaceVariant),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscure,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: AppStrings.setPasswordHint,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscure
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: colors.onSurfaceVariant,
                                ),
                                onPressed: () =>
                                    setState(() => _obscure = !_obscure),
                                tooltip: _obscure
                                    ? AppStrings.showPassword
                                    : AppStrings.hidePassword,
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return AppStrings.setPasswordRequired;
                              }
                              if (v.length < 8) {
                                return AppStrings.setPasswordTooShort;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.lg),

                          // Confirm password
                          Text(
                            AppStrings.setPasswordConfirmLabel,
                            style: AppTextStyles.label(colors.onSurfaceVariant),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          TextFormField(
                            controller: _confirmController,
                            obscureText: _obscure,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _saving ? null : _submit(),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return AppStrings.setPasswordConfirmRequired;
                              }
                              if (v != _passwordController.text) {
                                return AppStrings.setPasswordMismatch;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Pinned footer — keeps the button above the soft keyboard so a
            // single tap lands on it (see login/MFA screens for the rationale).
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl,
                AppSpacing.sm,
                AppSpacing.xl,
                AppSpacing.lg,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: ElevatedButton(
                    onPressed: _saving ? null : _submit,
                    child: _saving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                        : const Text(AppStrings.setPasswordSubmit),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

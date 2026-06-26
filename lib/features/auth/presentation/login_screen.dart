import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/theme/theme.dart';
import '../../../shared/models/app_strings.dart';
import 'auth_error_message.dart';
import 'providers/auth_provider.dart';

/// Login screen — entry point for all roles.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    // Close the keyboard now that the tap has registered.
    FocusScope.of(context).unfocus();
    await ref
        .read(authNotifierProvider.notifier)
        .signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
    if (!mounted) return;
    final authState = ref.read(authNotifierProvider);
    if (authState.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(signInErrorMessage(authState.error)),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
    // On success the router's refreshListenable fires and handles navigation
    // (to /mfa for manager/inspector or /children for other roles).
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable field area.
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
                          // Logo + wordmark
                          Image.asset('assets/images/logo.png', height: 80),
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
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            AppStrings.appTagline,
                            style: AppTextStyles.small(colors.onSurfaceVariant),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.xxxl),

                          // Email
                          Text(
                            AppStrings.emailLabel,
                            style: AppTextStyles.label(colors.onSurfaceVariant),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return AppStrings.emailRequired;
                              }
                              if (!v.contains('@')) {
                                return AppStrings.emailInvalid;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.lg),

                          // Password
                          Text(
                            AppStrings.passwordLabel,
                            style: AppTextStyles.label(colors.onSurfaceVariant),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return AppStrings.passwordRequired;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: colors.onSurfaceVariant,
                                ),
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                                tooltip: _obscurePassword
                                    ? AppStrings.showPassword
                                    : AppStrings.hidePassword,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),

                          // Forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () =>
                                  context.push(AppRoutes.forgotPassword),
                              child: const Text(AppStrings.forgotPassword),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Pinned action footer. The Sign In button lives here, outside the
            // scroll area, so it always sits ABOVE the soft keyboard and a
            // single tap lands on it. Previously it sat at the keyboard's top
            // edge inside the scroll view, so the first tap hit the keyboard
            // (dismissing it) and you had to tap a second time.
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
                    onPressed: isLoading ? null : _submit,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                        : const Text(AppStrings.signIn),
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

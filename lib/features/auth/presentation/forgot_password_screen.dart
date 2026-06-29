import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/theme/theme.dart';
import '../../../shared/models/app_strings.dart';

/// Forgot-password guidance. TailorEd accounts are provisioned by a manager,
/// so there is no open self-service reset — this screen tells the user how to
/// regain access (their manager resets it; they set a new password on next
/// sign-in via the forced set-password flow).
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(backgroundColor: colors.surface, elevation: 0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo.png', height: 72),
                  const SizedBox(height: AppSpacing.lg),
                  Icon(
                    Icons.lock_reset_outlined,
                    size: 40,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.forgotPasswordTitle,
                    style: AppTextStyles.h2(colors.onSurface),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    AppStrings.forgotPasswordBody,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.go(AppRoutes.login),
                      child: const Text(AppStrings.forgotPasswordBack),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

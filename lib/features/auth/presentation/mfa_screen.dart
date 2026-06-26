import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/network/supabase_client.dart';
import '../../../shared/models/app_strings.dart';
import 'auth_error_message.dart';

/// MFA screen — shown after password sign-in for Manager and Inspector roles.
///
/// Two modes:
///   Enrollment — user has no TOTP factor yet; shows the secret key and
///                prompts them to add it to their authenticator app.
///   Challenge  — user has a factor; asks for the current 6-digit code.
///
/// On success Supabase upgrades the session to AAL2, which fires
/// onAuthStateChange → router re-evaluates → redirect to /children.
class MfaScreen extends ConsumerStatefulWidget {
  const MfaScreen({super.key});

  @override
  ConsumerState<MfaScreen> createState() => _MfaScreenState();
}

enum _Mode { loading, enroll, challenge, error }

class _MfaScreenState extends ConsumerState<MfaScreen> {
  _Mode _mode = _Mode.loading;
  String? _errorMessage;

  // Enrollment state
  String? _enrollFactorId;
  String? _enrollSecret;
  bool _secretCopied = false;

  // Challenge state
  String? _challengeFactorId;

  // Shared
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _initialise();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _initialise() async {
    final client = ref.read(supabaseClientProvider);
    if (client == null) {
      setState(() {
        _mode = _Mode.error;
        _errorMessage = 'No Supabase connection.';
      });
      return;
    }

    try {
      final factors = await client.auth.mfa.listFactors();
      final totp = factors.totp;

      if (totp.isEmpty) {
        // No factor enrolled yet — start enrollment.
        final enroll = await client.auth.mfa.enroll(
          factorType: FactorType.totp,
          issuer: 'TailorEd Notes',
          friendlyName: 'Authenticator',
        );
        setState(() {
          _enrollFactorId = enroll.id;
          _enrollSecret = enroll.totp?.secret;
          _mode = _Mode.enroll;
        });
      } else {
        setState(() {
          _challengeFactorId = totp.first.id;
          _mode = _Mode.challenge;
        });
      }
    } catch (e) {
      setState(() {
        _mode = _Mode.error;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _verify() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    // Close the keyboard now that the tap has registered.
    FocusScope.of(context).unfocus();
    final client = ref.read(supabaseClientProvider);
    if (client == null) return;

    final factorId = _mode == _Mode.enroll
        ? _enrollFactorId
        : _challengeFactorId;
    if (factorId == null) return;

    setState(() => _isVerifying = true);
    try {
      await client.auth.mfa.challengeAndVerify(
        factorId: factorId,
        code: _codeController.text.trim(),
      );
      // Session upgraded to AAL2 — onAuthStateChange fires, router redirects.
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mfaErrorMessage(e)),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isVerifying = false);
    }
  }

  Future<void> _copySecret() async {
    if (_enrollSecret == null) return;
    await Clipboard.setData(ClipboardData(text: _enrollSecret!));
    if (!mounted) return;
    setState(() => _secretCopied = true);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text(AppStrings.mfaCopied)));
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
                    child: switch (_mode) {
                      _Mode.loading => const CircularProgressIndicator(),
                      _Mode.error => _ErrorBody(
                        message: _errorMessage ?? 'Error',
                      ),
                      _Mode.enroll => _body(
                        colors: colors,
                        title: AppStrings.mfaEnrollTitle,
                        body: AppStrings.mfaEnrollBody,
                        extra: _EnrollmentSecret(
                          secret: _enrollSecret ?? '',
                          copied: _secretCopied,
                          onCopy: _copySecret,
                        ),
                      ),
                      _Mode.challenge => _body(
                        colors: colors,
                        title: AppStrings.mfaTitle,
                        body: AppStrings.mfaChallengeBody,
                      ),
                    },
                  ),
                ),
              ),
            ),
            // Pinned Verify footer — keeps the button above the soft keyboard so
            // a single tap lands on it. It used to sit at the keyboard's top
            // edge inside the scroll view, so the first tap hit the keyboard.
            if (_mode == _Mode.enroll || _mode == _Mode.challenge)
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
                      onPressed: _isVerifying ? null : _verify,
                      child: _isVerifying
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.white,
                              ),
                            )
                          : const Text(AppStrings.mfaVerify),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _body({
    required ColorScheme colors,
    required String title,
    required String body,
    Widget? extra,
  }) {
    return Form(
      key: _formKey,
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
            title,
            style: AppTextStyles.h2(colors.onSurface),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            body,
            style: AppTextStyles.body(colors.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),

          if (extra != null) ...[const SizedBox(height: AppSpacing.xl), extra],

          if (_mode == _Mode.enroll) ...[
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.mfaEnrollConfirmPrompt,
              style: AppTextStyles.small(colors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],

          const SizedBox(height: AppSpacing.xl),
          Text(
            AppStrings.mfaCodeLabel,
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextFormField(
            controller: _codeController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            textAlign: TextAlign.center,
            style: AppTextStyles.h2(colors.onSurface),
            decoration: const InputDecoration(
              hintText: AppStrings.mfaCodeHint,
              counterText: '',
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return AppStrings.mfaCodeRequired;
              if (v.length != 6) return AppStrings.mfaCodeLength;
              return null;
            },
            onFieldSubmitted: (_) => _isVerifying ? null : _verify(),
          ),
        ],
      ),
    );
  }
}

// ── Enrollment secret display ─────────────────────────────────────────────────

class _EnrollmentSecret extends StatelessWidget {
  const _EnrollmentSecret({
    required this.secret,
    required this.copied,
    required this.onCopy,
  });

  final String secret;
  final bool copied;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.mfaSecretLabel,
          style: AppTextStyles.label(colors.onSurfaceVariant),
        ),
        const SizedBox(height: AppSpacing.sm),
        Material(
          color: colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: InkWell(
            onTap: onCopy,
            borderRadius: BorderRadius.circular(AppRadius.card),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      secret,
                      style: AppTextStyles.body(colors.onSurface).copyWith(
                        letterSpacing: 2,
                        fontFeatures: [const FontFeature.tabularFigures()],
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Icon(
                    copied ? Icons.check : Icons.copy_outlined,
                    size: 18,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Error body ────────────────────────────────────────────────────────────────

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Icon(Icons.error_outline, color: colors.error, size: 48),
        const SizedBox(height: AppSpacing.md),
        Text(
          message,
          style: AppTextStyles.body(colors.onSurface),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

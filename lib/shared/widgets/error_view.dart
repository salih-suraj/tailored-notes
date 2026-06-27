import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';
import '../errors/friendly_error.dart';
import '../models/app_strings.dart';

/// Standard error state widget used across all screens.
///
/// Prefer passing the raw [error] object — it's run through [friendlyError] so
/// users see a clear sentence, never a status code or exception string. Use
/// [message] only for an already-human string.
class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.message, this.error, this.onRetry})
    : assert(
        message != null || error != null,
        'Provide either a message or an error',
      );

  final String? message;
  final Object? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = error != null
        ? friendlyError(error)
        : (message?.isNotEmpty ?? false ? message! : AppStrings.unknownError);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: colors.error),
            const SizedBox(height: AppSpacing.lg),
            Text(
              text,
              style: AppTextStyles.body(colors.onSurface),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.xl),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text(AppStrings.retry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

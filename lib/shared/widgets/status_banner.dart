import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

/// How loud a [StatusBanner] should read.
enum StatusEmphasis {
  /// Tinted fill + thin border, single-colour text. For "needs attention"
  /// notices (e.g. documentation falling behind).
  standard,

  /// Stronger fill + a 1.5px border + a filled icon + high-contrast body text.
  /// For safety-critical flags that must read at arm's length (e.g. allergies).
  loud,
}

/// The app's one status/alert/safety banner. Colour carries the meaning
/// (red = critical/overdue, amber = attention) and stays legible in both
/// themes — never muted into elegance. Reused across screens so every warning
/// looks and behaves the same.
class StatusBanner extends StatelessWidget {
  const StatusBanner({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    this.message,
    this.emphasis = StatusEmphasis.standard,
    this.onTap,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String? message;
  final StatusEmphasis emphasis;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final loud = emphasis == StatusEmphasis.loud;

    final fill = color.withAlpha(
      loud ? (isDark ? 48 : 26) : (isDark ? 40 : 20),
    );
    final border = color.withAlpha(loud ? 150 : 80);
    final titleStyle = loud
        ? AppTextStyles.label(color).copyWith(fontWeight: FontWeight.w700)
        : AppTextStyles.label(color);
    final messageStyle = loud
        ? AppTextStyles.body(
            colors.onSurface,
          ).copyWith(fontWeight: FontWeight.w600)
        : AppTextStyles.small(color);

    final content = Container(
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: border, width: loud ? 1.5 : 1),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: loud ? 22 : 18),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleStyle),
                if (message != null && message!.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(message!, style: messageStyle),
                ],
              ],
            ),
          ),
          if (onTap != null) ...[
            const SizedBox(width: AppSpacing.xs),
            Icon(Icons.chevron_right, color: color, size: 18),
          ],
        ],
      ),
    );

    if (onTap == null) return content;

    return Semantics(
      button: true,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: content,
        ),
      ),
    );
  }
}

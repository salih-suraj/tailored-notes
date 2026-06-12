import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/connectivity_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../models/app_strings.dart';

/// Thin amber strip shown while the device is offline. Renders nothing when
/// online. Records keep saving locally — the sync engine uploads them when
/// connectivity returns, which is exactly what this banner tells staff.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final online = ref.watch(isOnlineProvider);
    if (online) return const SizedBox.shrink();

    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        color: AppColors.amber,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off_outlined,
                size: 16, color: AppColors.white),
            const SizedBox(width: AppSpacing.sm),
            Flexible(
              child: Text(
                AppStrings.offlineBanner,
                style: AppTextStyles.small(AppColors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

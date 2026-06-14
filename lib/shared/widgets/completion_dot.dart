import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../models/shift_completion.dart';
import '../providers/shift_completion_provider.dart';

/// A 10×10 coloured dot showing documentation status for one child's current shift.
/// Red = nothing done · Amber = started · Green = all complete.
class CompletionDot extends ConsumerWidget {
  const CompletionDot({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completion = ref.watch(shiftCompletionProvider(childId));
    final color = _colorFor(completion.status);

    return Semantics(
      label:
          'Documentation ${completion.completedCount} of ${completion.totalCount} complete',
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }

  Color _colorFor(CompletionStatus status) => switch (status) {
    CompletionStatus.none => AppColors.red,
    CompletionStatus.partial => AppColors.amber,
    CompletionStatus.complete => AppColors.green,
  };
}

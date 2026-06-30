import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/app_strings.dart';

/// Wraps an editor so leaving with unsaved input prompts "Discard changes?".
///
/// Pass the editor's text controllers; the guard snapshots their values when it
/// first builds (after the editor's initState has populated them) and treats
/// any later difference as unsaved changes. For non-text state (toggles, dates,
/// chips) pass [extraHasChanges]. Evaluated at pop time, so the editor doesn't
/// need to rebuild on every keystroke.
class UnsavedChangesGuard extends StatefulWidget {
  const UnsavedChangesGuard({
    super.key,
    required this.controllers,
    required this.child,
    this.extraHasChanges,
  });

  final List<TextEditingController> controllers;
  final bool Function()? extraHasChanges;
  final Widget child;

  @override
  State<UnsavedChangesGuard> createState() => _UnsavedChangesGuardState();
}

class _UnsavedChangesGuardState extends State<UnsavedChangesGuard> {
  late final List<String> _initial = widget.controllers
      .map((c) => c.text)
      .toList();

  bool _hasChanges() {
    for (var i = 0; i < widget.controllers.length; i++) {
      if (widget.controllers[i].text != _initial[i]) return true;
    }
    return widget.extraHasChanges?.call() ?? false;
  }

  Future<bool> _confirmDiscard() async {
    final discard = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.unsavedTitle),
        content: const Text(AppStrings.unsavedBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.unsavedKeepEditing),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            child: const Text(AppStrings.unsavedDiscard),
          ),
        ],
      ),
    );
    return discard ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (!_hasChanges()) {
          if (context.mounted) context.pop();
          return;
        }
        final discard = await _confirmDiscard();
        if (discard && context.mounted) context.pop();
      },
      child: widget.child,
    );
  }
}

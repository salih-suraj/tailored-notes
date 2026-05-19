import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Temporary screen used while a feature is not yet built.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title\n(coming soon)',
          style: AppTextStyles.body(colors.onSurface),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

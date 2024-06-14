import 'package:flutter/material.dart';
import 'package:portfolio/src/config/theme_extension.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).extension<ExtensionColors>()?.cardBackgroundColor,
      margin: const EdgeInsets.all(24.0),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(child: child),
      ),
    );
  }
}

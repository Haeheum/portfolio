import 'package:flutter/material.dart';

import '../../config/theme_extension.dart';

class GridItemProjects extends StatelessWidget {
  const GridItemProjects({super.key, this.child, this.paddingValue = 24.0});

  final Widget? child;
  final double paddingValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
        Theme.of(context).extension<ExtensionColors>()?.cardBackgroundColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Center(
          child: child ??
              Container(
                color: Colors.transparent,
              ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../config/theme_extension.dart';
import 'view_terminal.dart';

class FramePortfolioItem extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback? onTap;
  final Widget? child;

  const FramePortfolioItem({
    super.key,
    required this.title,
    required this.body,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            Theme.of(context).extension<ExtensionColors>()?.cardBackgroundColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Flexible(
            child: ViewTerminal(
              title: title,
              body: body,
              onTap: onTap,
            ),
          ),
          const SizedBox(height: 12.0),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(child: child ?? Container(color: Colors.transparent)),
            ),
          ),
        ],
      ),
    );
  }
}

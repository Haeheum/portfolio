import 'package:flutter/material.dart';
import 'package:portfolio/src/config/theme_extension.dart';

import '../../../generated/l10n.dart';
import 'model_achievement.dart';

class ViewPageItem extends StatelessWidget {
  const ViewPageItem({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
      color: Theme.of(context).extension<ExtensionColors>()!.cardBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Center(
                child: Image.asset(
                  achievement.assetPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Column(
                  children: [
                    Text(
                      S.of(context).achievementDate(achievement.achievedDate),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context)
                              .extension<ExtensionColors>()!
                              .textColor),
                    ),
                    Text(
                      achievement.description,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context)
                              .extension<ExtensionColors>()!
                              .textColor),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

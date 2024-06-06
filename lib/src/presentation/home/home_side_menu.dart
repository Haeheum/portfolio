import 'package:flutter/material.dart';

import 'profile_image_widget.dart';
import 'music_control_widget.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        width: 362.0,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: ProfileImageWidget(),
            ),
            MusicControlWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../config/theme_extension.dart';
import '../../audio/widget_audio_controller.dart';
import 'button_animated_play_pause.dart';

class ViewMusicControl extends StatelessWidget {
  const ViewMusicControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      height: 100.0,
      constraints: const BoxConstraints(maxWidth: 450.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: WidgetAudioController.of(context).musicName,
                    builder: (_, musicName, ___) {
                      return Text(
                        musicName,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .extension<ExtensionColors>()!
                                .textColor),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                      valueListenable: WidgetAudioController.of(context).artistName,
                      builder: (_, artistName, ___) {
                        return Text(
                          artistName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .extension<ExtensionColors>()!
                                      .textColor),
                        );
                      }),
                ],
              ),
            ),
          ),
          const SizedBox(width: 24),
          IconButton(
            onPressed: WidgetAudioController.of(context).previousBgm,
            icon: const Icon(Icons.skip_previous),
          ),
          const ButtonAnimatedPlayPause(),
          IconButton(
            onPressed: () {
              WidgetAudioController.of(context).nextBgm(null);
            },
            icon: const Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }
}

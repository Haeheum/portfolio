import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../audio/audio_controller.dart';
import 'animated_play_button.dart';
import 'profile_image_widget.dart';

class MusicControlWidget extends StatelessWidget {
  const MusicControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100.0,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            border: Border.all(
                width: 2.0,
                color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(25.0),
          ),
          constraints: const BoxConstraints(maxWidth: 580.0),
          child: Row(
            children: [
              if (MediaQuery.sizeOf(context).width < 840) ...[
                const SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: ProfileImageWidget(),
                ),
                const SizedBox(width: 12.0),
              ],
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                      valueListenable: AudioController.of(context).musicName,
                      builder: (_, musicName, ___) {
                        return Text(musicName);
                      }),
                  ValueListenableBuilder(
                      valueListenable: AudioController.of(context).artistName,
                      builder: (_, artistName, ___) {
                        return Text(artistName);
                      }),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: AudioController.of(context).previousBgm,
                icon: const Icon(Icons.skip_previous),
              ),
              Tooltip(
                  message: AppLocalizations.of(context)!.comment,
                  child: const AnimatedPlayButton()),
              IconButton(
                onPressed: () {
                  AudioController.of(context).nextBgm(null);
                },
                icon: const Icon(Icons.skip_next),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

import '../../audio/audio_controller.dart';

class AudioVolumeControlButton extends StatefulWidget {
  const AudioVolumeControlButton({super.key});

  @override
  State<AudioVolumeControlButton> createState() =>
      _AudioVolumeControllerButtonState();
}

class _AudioVolumeControllerButtonState
    extends State<AudioVolumeControlButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Align(
        alignment: Alignment.centerLeft,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHover = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHover = false;
            });
          },
          child: AnimatedContainer(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: _isHover ? Theme.of(context).hoverColor : null,
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: _isHover ? min(constraints.maxWidth, 400.0) : 40.0,
            height: 40.0,
            duration: const Duration(milliseconds: 200),
            child: ValueListenableBuilder(
              valueListenable: AudioController.of(context).volume,
              builder: (context, volume, _) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (volume == 0) {
                          AudioController.of(context).setBgmVolume(
                              AudioControllerState.kDefaultVolume);
                        } else {
                          AudioController.of(context).setBgmVolume(0.0);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 40.0,
                        height: 40.0,
                        child: switch (volume) {
                          0.0 => const Icon(Icons.volume_mute_rounded),
                          >= 0.0 && < 0.5 =>
                            const Icon(Icons.volume_down_rounded),
                          >= 0.5 => const Icon(Icons.volume_up_rounded),
                          _ => throw RangeError('Volume cannot be negative'),
                        },
                      ),
                    ),
                    if (_isHover)
                      Expanded(
                        child: Slider(
                          value: volume,
                          onChanged: (newVolume) {
                            AudioController.of(context).setBgmVolume(newVolume);
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}

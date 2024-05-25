import 'package:flutter/material.dart';

import 'enum/audio_aspect_enum.dart';

class AudioModel extends InheritedModel<AudioAspect> {
  const AudioModel(
      {super.key,
      required this.isPlaying,
      required this.volume,
      required super.child});

  final bool isPlaying;
  final double volume;

  static bool isPlayingOf(BuildContext context) {
    return InheritedModel.inheritFrom<AudioModel>(context,
            aspect: AudioAspect.isPlaying)!.isPlaying;
  }

  static double volumeOf(BuildContext context) {
    return InheritedModel.inheritFrom<AudioModel>(context,
        aspect: AudioAspect.volume)!.volume;
  }

  @override
  bool updateShouldNotify(AudioModel oldWidget) {
    return isPlaying != oldWidget.isPlaying || volume != oldWidget.volume;
  }

  @override
  bool updateShouldNotifyDependent(
      AudioModel oldWidget, Set<AudioAspect> dependencies) {
    if (isPlaying != oldWidget.isPlaying &&
        dependencies.contains((AudioAspect.isPlaying))) {
      return true;
    }

    if (volume != oldWidget.volume &&
        dependencies.contains((AudioAspect.volume))) {
      return true;
    }
    return false;
  }
}

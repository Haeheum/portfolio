import 'package:flutter/material.dart';

import '../audio/audio_controller.dart';

class AnimatedPlayPauseButton extends StatefulWidget {
  const AnimatedPlayPauseButton({super.key});

  @override
  State<AnimatedPlayPauseButton> createState() => _AnimatedPlayPauseButtonState();
}

class _AnimatedPlayPauseButtonState extends State<AnimatedPlayPauseButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    if(AudioController.of(context).isPlaying){
      _animationController.animateTo(1.0, duration: const Duration(seconds: 0));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.play_pause, progress: _animationController),
      onPressed: () {
        if (AudioController.of(context).isPlaying) {
          _animationController.reverse();
          AudioController.of(context).pauseBgm();
        } else {
          _animationController.forward();
          AudioController.of(context).playBgm();
        }
      },
    );
  }
}

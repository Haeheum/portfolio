import 'package:flutter/material.dart';

import '../audio/audio_controller.dart';

class AnimatedPlayButton extends StatefulWidget {
  const AnimatedPlayButton({super.key});

  @override
  State<AnimatedPlayButton> createState() => _AnimatedPlayButtonState();
}

class _AnimatedPlayButtonState extends State<AnimatedPlayButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
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
        setState(() {
          if (AudioController.of(context).isPlaying.value) {
            _animationController.reverse();
            AudioController.of(context).pauseBgm();
          } else {
            _animationController.forward();
            AudioController.of(context).playBgm();
          }
        });
      },
    );
  }
}

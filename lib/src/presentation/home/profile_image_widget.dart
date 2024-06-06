import 'package:flutter/material.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  double _targetScale = 1.00;

  void _changeRadius(bool isHovering) {
    setState(() {
      if (isHovering) {
        _targetScale = 1.05;
      } else {
        _targetScale = 1.00;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (isHovering) {
        _changeRadius(isHovering);
      },
      child: AnimatedScale(
        scale: _targetScale,
        duration: const Duration(milliseconds: 300),
        child: const CircleAvatar(
          foregroundImage: AssetImage('images/haeheumjo.jpeg'),
          radius: 150.0,
        ),
      ),
    );
  }
}

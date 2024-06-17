import 'package:flutter/material.dart';

class ButtonOptionMenuControl extends StatefulWidget {
  const ButtonOptionMenuControl(
      {super.key, required this.isLeft, required this.onTap});

  final bool isLeft;
  final VoidCallback onTap;

  @override
  State<ButtonOptionMenuControl> createState() =>
      _ButtonOptionMenuControlState();
}

class _ButtonOptionMenuControlState extends State<ButtonOptionMenuControl> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isHover ? Theme.of(context).hoverColor : null,
            borderRadius: BorderRadius.circular(20.0),
          ),
          width: 40.0,
          height: 40.0,
          duration: const Duration(milliseconds: 200),
          child: Icon(widget.isLeft
              ? Icons.chevron_left_rounded
              : Icons.chevron_right_rounded),
        ),
      ),
    );
  }
}

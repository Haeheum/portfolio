import 'package:flutter/material.dart';

class ScaleOnHover extends StatefulWidget {
  const ScaleOnHover({
    super.key,
    required this.child,
    this.defaultScale = 1.0,
    this.targetScale = 1.1,
    this.duration = const Duration(milliseconds: 300),
    this.onTap,
    this.onHover,
  });

  final Widget child;
  final double defaultScale;
  final double targetScale;
  final Duration duration;
  final VoidCallback? onTap;
  final ValueSetter<bool>? onHover;

  @override
  State<ScaleOnHover> createState() => _ScaleOnHoverState();
}

class _ScaleOnHoverState extends State<ScaleOnHover> {
  late double _currentScale;

  void _changeScale(bool isHovering) {
    setState(() {
      _currentScale = isHovering ? widget.targetScale : widget.defaultScale;
    });
  }

  @override
  void initState() {
    super.initState();
    _currentScale = widget.defaultScale;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: FocusableActionDetector(
        onShowHoverHighlight: (isHovering) {
          _changeScale(isHovering);
          if (widget.onHover != null) {
            widget.onHover!(isHovering);
          }
        },
        child: AnimatedScale(
            scale: _currentScale,
            duration: widget.duration,
            child: widget.child),
      ),
    );
  }
}

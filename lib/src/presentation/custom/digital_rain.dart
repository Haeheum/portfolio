import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../config/theme_extension.dart';
import '../../model/vector.dart';

class DigitalRain extends StatefulWidget {
  const DigitalRain({
    super.key,
  });

  @override
  State<DigitalRain> createState() => _RainingTextsState();
}

class _RainingTextsState extends State<DigitalRain>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RainingTextsPainter(
          animation: _controller,
          skyColor: Theme.of(context).extension<ExtensionColors>()!.skyColor!,
          rainColor: Theme.of(context).extension<ExtensionColors>()!.rainColor!,
          backgroundColor:
              Theme.of(context).extension<ExtensionColors>()!.backgroundColor!),
      willChange: true,
      child: const SizedBox.expand(),
    );
  }

  void stopAnimation() {
    _controller.stop();
  }

  void resumeAnimation() {
    _controller.repeat();
  }
}

class RainingTextsPainter extends CustomPainter {
  final Color _skyColor;
  final Color _rainColor;
  final Color _backgroundColor;

  late Rect _canvasRectangle;
  final _skyPaint = Paint();
  late final LinearGradient _skyGradient;

  final int _rainCount = 100;
  late List<_SingleRainDrop> _rain;
  Size? _size;
  DateTime _lastTime = DateTime.now();

  RainingTextsPainter(
      {required Listenable animation,
      required Color skyColor,
      required Color rainColor,
      required Color backgroundColor})
      : _skyColor = skyColor,
        _rainColor = rainColor,
        _backgroundColor = backgroundColor,
        super(repaint: animation) {
    _skyGradient = LinearGradient(
      colors: [_skyColor, _backgroundColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_size == null) {
      _canvasRectangle = Rect.fromLTWH(
          0, -kToolbarHeight, size.width, size.height + kToolbarHeight);
      _skyPaint.shader = _skyGradient.createShader(_canvasRectangle);

      _rain = List.generate(_rainCount, (i) {
        return _SingleRainDrop(
          rainColor: _rainColor,
          bounds: size,
        );
      });
    }

    final didResize = _size != null && _size != size;
    final now = DateTime.now();
    final dt = now.difference(_lastTime);

    if (didResize) {
      // New background
      _canvasRectangle = Rect.fromLTWH(
          0, -kToolbarHeight, size.width, size.height + kToolbarHeight);
      _skyPaint.shader = _skyGradient.createShader(_canvasRectangle);
    }
    // Draw background
    canvas.drawRect(_canvasRectangle, _skyPaint);

    for (final raindrop in _rain) {
      if (didResize) {
        raindrop.updateBounds(size);
      }

      raindrop.update(dt.inMilliseconds / 1000);
      raindrop.draw(canvas);
    }

    _size = size;
    _lastTime = now;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _SingleRainDrop {
  static final Random _random = Random();

  Size _bounds;

  late final Vector _position = Vector(
    _random.nextDouble() * _bounds.width,
    _random.nextDouble() * _bounds.height -
        (_bounds.height + kToolbarHeight + kToolbarHeight),
  );
  final double _length = 5 + _random.nextDouble() * 20;

  bool _useReducedLength = false;
  late double _reducedLength;

  late final double _ySpeed = sqrt(_length) * 70 + _random.nextDouble() * 70;

  final _rainPaint = Paint();

  _SingleRainDrop({
    required Color rainColor,
    required Size bounds,
  }) : _bounds = bounds {
    _rainPaint.color = rainColor;
  }

  void draw(Canvas canvas) {
    Rect rainRect = Rect.fromPoints(
        Offset(_position.x - _length / 50, _position.y),
        _useReducedLength
            ? Offset(_position.x + _length / 50, _position.y + _reducedLength)
            : Offset(_position.x + _length / 50, _position.y + _length));
    canvas.drawRect(rainRect, _rainPaint);
  }

  void update(double dt) {
    if (_position.y + _length > _bounds.height) {
      _useReducedLength = true;
      _reducedLength = _bounds.height - _position.y;
    }

    if (_position.y > _bounds.height) {
      _useReducedLength = false;
      _position.x = _random.nextDouble() * _bounds.width;
      _position.y = -_length - kToolbarHeight;
    }
    _position.y += _ySpeed * dt;
  }

  void updateBounds(Size newBounds) {
    if (!newBounds.contains(Offset(_position.x, _position.y))) {
      if (!newBounds.contains(
          Offset(_position.x, _position.y + _length + kToolbarHeight))) {
        _position.x = _random.nextDouble() * newBounds.width;
        _position.y = (-_length - kToolbarHeight);
      }
    }
    _bounds = newBounds;
  }
}

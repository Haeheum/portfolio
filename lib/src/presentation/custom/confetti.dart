import 'dart:collection';
import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../model/vector.dart';

class Confetti extends StatefulWidget {
  static const _defaultColors = [
    Color(0xffff3232),
    Color(0xffff9c38),
    Color(0xffffea34),
    Color(0xff2eff60),
    Color(0xff1d75fb),
  ];

  final bool isStopped;

  final List<Color> colors;

  const Confetti({
    this.colors = _defaultColors,
    this.isStopped = false,
    super.key,
  });

  @override
  State<Confetti> createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ConfettiPainter(
        colors: widget.colors,
        animation: _controller,
      ),
      willChange: true,
      child: const SizedBox.expand(),
    );
  }

  @override
  void didUpdateWidget(covariant Confetti oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isStopped && !widget.isStopped) {
      _controller.repeat();
    } else if (!oldWidget.isStopped && widget.isStopped) {
      _controller.stop(canceled: false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    if (!widget.isStopped) {
      _controller.repeat();
    }
  }
}

class ConfettiPainter extends CustomPainter {
  final defaultPaint = Paint();

  final int _snippingCount = 100;

  late final List<_PaperSnipping> _snippings;

  Size? _size;

  DateTime _lastTime = DateTime.now();

  final UnmodifiableListView<Color> colors;

  ConfettiPainter(
      {required Listenable animation, required Iterable<Color> colors})
      : colors = UnmodifiableListView(colors),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (_size == null) {
      // First time we have a size.
      _snippings = List.generate(
          _snippingCount,
          (i) => _PaperSnipping(
                frontColor: colors[i % colors.length],
                bounds: size,
              ));
    }

    final didResize = _size != null && _size != size;
    final now = DateTime.now();
    final dt = now.difference(_lastTime);
    for (final snipping in _snippings) {
      if (didResize) {
        snipping.updateBounds(size);
      }
      snipping.update(dt.inMilliseconds / 1000);
      snipping.draw(canvas);
    }

    _size = size;
    _lastTime = now;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _PaperSnipping {
  static final Random _random = Random();

  static const _degToRad = pi / 180;

  static const _backSideBlend = Color(0x70EEEEEE);

  Size _bounds;

  late final Vector _position = Vector(
    _random.nextDouble() * _bounds.width,
    _random.nextDouble() * _bounds.height,
  );

  final double _rotationSpeed = 800 + _random.nextDouble() * 600;
  final double _angle = _random.nextDouble() * 360 * _degToRad;
  double _rotation = _random.nextDouble() * 360 * _degToRad;
  double _cosA = 1.0;

  final double _size = 7.0;
  final double _oscillationSpeed = 0.5 + _random.nextDouble() * 1.5;
  final double _xSpeed = 40;
  final double _ySpeed = 50 + _random.nextDouble() * 60;

  late final List<Vector> _corners = List.generate(4, (i) {
    final angle = _angle + _degToRad * (45 + i * 90);
    return Vector(cos(angle), sin(angle));
  });

  double _time = _random.nextDouble();
  final Color frontColor;
  late final Color _backColor = Color.alphaBlend(_backSideBlend, frontColor);
  final _snippingPaint = Paint()..style = PaintingStyle.fill;

  _PaperSnipping({
    required this.frontColor,
    required Size bounds,
  })  :
        _bounds = bounds;

  void draw(Canvas canvas) {
    if (_cosA > 0) {
      _snippingPaint.color = frontColor;
    } else {
      _snippingPaint.color = _backColor;
    }

    final path = Path()
      ..addPolygon(
        List.generate(
            4,
            (index) => Offset(
              _position.x + _corners[index].x * _size,
              _position.y + _corners[index].y * _size * _cosA,
                )),
        true,
      );
    canvas.drawPath(path, _snippingPaint);
  }

  void update(double dt) {
    _time += dt;
    _rotation += _rotationSpeed * dt;
    _cosA = cos(_degToRad * _rotation);
    _position.x += cos(_time * _oscillationSpeed) * _xSpeed * dt;
    _position.y += _ySpeed * dt;
    if (_position.y > _bounds.height) {
      _position.x = _random.nextDouble() * _bounds.width;
      _position.y = 0;
    }
  }

  void updateBounds(Size newBounds) {
    if (!newBounds.contains(Offset(_position.x, _position.y))) {
      _position.x = _random.nextDouble() * newBounds.width;
      _position.y = _random.nextDouble() * newBounds.height;
    }
    _bounds = newBounds;
  }
}

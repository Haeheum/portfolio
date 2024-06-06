import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

import '../scope/app_state_scope.dart';
import 'vector.dart';

class DigitalRain extends StatefulWidget {
  const DigitalRain({
    super.key,
    this.isStopped = false,
  });

  final bool isStopped;

  @override
  State<DigitalRain> createState() => _RainingTextsState();
}

class _RainingTextsState extends State<DigitalRain>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const Iterable<String> _ko = [
    '오\n디\n오',
    '비\n디\n오',
    '에\n니\n메\n이\n션',
    '화\n면\n전\n환',
    '라\n우\n트\n관\n리',
    '웹\n뷰',
    '반\n응\n형\n&\n적\n응\n형',
    '푸\n시\n메\n세\n지',
    '결\n제',
    '딥\n링\n크',
    '블\n루\n투\n스',
    '국\n제\n화\n지\n원',
    '테\n스\n트\n코\n드',
    '성\n능\n최\n적\n화',
    '자\n동\n배\n포',
    '아\n키\n텍\n쳐\n패\n턴',
    'R\nE\nS\nT\nA\nP\nI',
    '리\n팩\n토\n링',
    '난\n독\n화',
    '상\n태\n관\n리',
    '비\n동\n기\n프\n로\n그\n래\n밍',
    '예\n외\n처\n리'
  ];
  static const Iterable<String> _en = [
    'audio',
    'video',
    'animation',
    'transition',
    'route management',
    'web view',
    'responsive & adaptive',
    'push message',
    'payment',
    'deeplink',
    'bluetooth',
    'internationalization',
    'test code',
    'performance & optimization',
    'continuous deployment',
    'architecture pattern',
    'RESTAPI',
    'refactoring',
    'obfuscation',
    'state management',
    'asynchronous programming'
    'exception handling'
  ];

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DigitalRain oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isStopped && !widget.isStopped) {
      _controller.repeat();
    } else if (!oldWidget.isStopped && widget.isStopped) {
      _controller.stop(canceled: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RainingTextsPainter(
        animation: _controller,
        textsData: switch (AppStateScope.of(context).languageCode) {
          'ko' => _ko,
          'en' => _en,
          _ => throw UnimplementedError('Unsupported language')
        },
      ),
      willChange: true,
      child: const SizedBox.expand(),
    );
  }
}

class RainingTextsPainter extends CustomPainter {
  final defaultPaint = Paint();

  final int rainingTextsCount = 100;
  late List<_RainingText> _rainingTexts;

  Size? _size;
  DateTime _lastTime = DateTime.now();

  final _texts = Queue<String>();

  RainingTextsPainter(
      {required Listenable animation, required Iterable<String> textsData})
      : super(repaint: animation) {
    _texts.addAll(textsData);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_size == null) {
      _rainingTexts = List.generate(rainingTextsCount, (i) {
        return _RainingText(
            text: _texts.elementAt(Random().nextInt(_texts.length)),
            bounds: size);
      });
    }
    final didResize = _size != null && _size != size;
    final now = DateTime.now();
    final dt = now.difference(_lastTime);

    for (final rainingText in _rainingTexts) {
      if (didResize) {
        rainingText.updateBounds(size);
      }
      rainingText.update(dt.inMilliseconds / 1000);
      rainingText.draw(canvas);
    }

    _size = size;
    _lastTime = now;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _RainingText {
  static final Random _random = Random();

  final String _text;
  Size _bounds;

  late final Vector position = Vector(
    _random.nextDouble() * _bounds.width,
    _random.nextDouble() * _bounds.height,
  );

  final double _ySpeed = 50 + _random.nextDouble() * 80;

  late final TextPainter _textPainter;

  _RainingText({
    required String text,
    required Size bounds,
  })  : _text = text,
        _bounds = bounds {
    _textPainter = TextPainter(
      text: TextSpan(children: [
        TextSpan(
          text: _text.substring(0, _text.length - 1),
          style: const TextStyle(
            color: Colors.green,
            fontSize: 20.0,
            shadows: [
              Shadow(
                color: Colors.green,
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
        TextSpan(
          text: _text.substring(_text.length - 1, _text.length),
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 20.0,
            shadows: [
              Shadow(
                color: Colors.blueGrey,
                blurRadius: 3.0,
              ),
            ],
          ),
        )
      ]),
      textDirection: TextDirection.ltr,
    )..layout();
  }

  void draw(Canvas canvas) {
    _textPainter.paint(canvas, Offset(position.x, position.y));
  }

  void update(double dt) {
    position.y += _ySpeed * dt;
    if (position.y > _bounds.height) {
      position.x = _random.nextDouble() * _bounds.width;
      position.y = -_textPainter.height;
    }
  }

  void updateBounds(Size newBounds) {
    if (!newBounds.contains(Offset(position.x, position.y))) {
      if (!newBounds
          .contains(Offset(position.x, position.y + _textPainter.height))) {
        position.x = _random.nextDouble() * newBounds.width;
        position.y = -_textPainter.height;
      }
    }
    _bounds = newBounds;
  }
}

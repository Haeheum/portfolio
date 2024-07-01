import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/src/util/ticking_builder.dart';

import '../../config/theme_extension.dart';

class ShaderWater extends StatefulWidget {
  const ShaderWater({super.key});

  @override
  State<ShaderWater> createState() => _RainingTextsState();
}

class _RainingTextsState extends State<ShaderWater>
    with SingleTickerProviderStateMixin {
  late final FragmentShader _shader;

  @override
  void initState() {
    super.initState();
    _shader = fragmentProgram.fragmentShader();
  }

  @override
  void dispose() {
    _shader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).extension<ExtensionColors>()!.skyColor!,
      child: TickingBuilder(builder: (context, time) {
        return AnimatedSampler(
              (image, size, canvas) {
            _shader
              ..setFloat(0, size.width)
              ..setFloat(1, size.height)
              ..setFloat(2, time)
              ..setImageSampler(0, image);
            Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
            canvas.drawRect(rect, Paint()..shader = _shader);
          },
          child: Image.asset('assets/images/me.jpeg'),
        );
      }),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/theme_extension.dart';
import '../custom/digital_rain.dart';


class FirstPageView extends StatelessWidget {
  const FirstPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DigitalRain(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: FlutterLogo(),
                      ),
                      const SizedBox(width: 20.0),
                      Text(
                        AppLocalizations.of(context)!.title1,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context)
                                .extension<ExtensionColors>()!
                                .matrixTitleColor,
                            fontSize: 100,
                            shadows: [
                              Shadow(
                                  color: Theme.of(context)
                                      .extension<ExtensionColors>()!
                                      .matrixShadowColor!,
                                  blurRadius: 10.0)
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 360.0),
            ],
          ),
        ),
      ],
    );
  }
}

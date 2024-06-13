import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../config/theme_extension.dart';
import '../common/scale_on_hover.dart';
import '../custom/digital_rain.dart';
import '../strength/page_strength.dart';
import 'appBar/app_bar_home.dart';
import 'music_control_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Stack(children: [
        const DigitalRain(),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 800,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: Card(
                  color: Colors.white.withOpacity(0.3),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(16.0),
                                color: Colors.transparent,
                                child: ScaleOnHover(
                                  tooltipMessage:
                                      S.of(context).milestoneTooltip,
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .extension<
                                                          ExtensionColors>()!
                                                      .textColor),
                                        ),
                                        Text(
                                          S.of(context).myName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .extension<
                                                          ExtensionColors>()!
                                                      .textColor),
                                        ),
                                        Text(
                                          S.of(context).dateOfBirth,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .extension<
                                                          ExtensionColors>()!
                                                      .textColor),
                                        ),
                                        Text(
                                          S.of(context).myBirthdate(
                                              DateTime(1994, 7, 25)),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .extension<
                                                          ExtensionColors>()!
                                                      .textColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 16.0, 16.0, 16.0),
                                child: ScaleOnHover(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StrengthPage()),
                                    );
                                  },
                                  tooltipMessage: S.of(context).strengthTooltip,
                                  child: Image.asset(
                                    'assets/images/haeheumjo.jpeg',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          color: Theme.of(context)
                              .extension<ExtensionColors>()!
                              .cardBackgroundColor,
                          child: LayoutBuilder(builder: (context, constraints) {
                            return ScaleOnHover(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const StrengthPage()),
                                );
                              },
                              tooltipMessage: S.of(context).projectsTooltip,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterLogo(
                                    size: constraints.maxHeight / 2,
                                    style: FlutterLogoStyle.markOnly,
                                    duration: const Duration(seconds: 0),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    S.of(context).developer,
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight / 2,
                                        color: Theme.of(context)
                                            .extension<ExtensionColors>()!
                                            .textColor),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          tooltip: S.of(context).musicTooltip,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              enableDrag: false,
              builder: (BuildContext context) {
                return const MusicControlPanel();
              },
              backgroundColor: Theme.of(context)
                  .extension<ExtensionColors>()!
                  .cardBackgroundColor,
            );
          },
          child: const Icon(Icons.music_note_rounded)),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/theme_extension.dart';
import '../common/scale_on_hover.dart';
import '../custom/digital_rain.dart';
import 'appBar/app_bar_home.dart';
import 'music_control_panel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
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
                                          AppLocalizations.of(context)!
                                              .milestoneTooltip,
                                      child: FittedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .myName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge
                                                  ?.copyWith(
                                                      color: Theme.of(context)
                                                          .extension<
                                                              ExtensionColors>()!
                                                          .textColor),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .myBirthdate(
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
                                        0, 16.0, 16.0, 16.0),
                                    child: ScaleOnHover(
                                      tooltipMessage:
                                          AppLocalizations.of(context)!
                                              .strengthTooltip,
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              color: Theme.of(context)
                                  .extension<ExtensionColors>()!
                                  .cardBackgroundColor,
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return ScaleOnHover(
                                  tooltipMessage: AppLocalizations.of(context)!
                                      .projectsTooltip,
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
                                        AppLocalizations.of(context)!.developer,
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
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          tooltip: AppLocalizations.of(context)!.musicTooltip,
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

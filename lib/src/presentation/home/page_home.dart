import 'package:flutter/material.dart';
import 'package:portfolio/src/presentation/about_me/page_about_me.dart';

import '../../../generated/l10n.dart';
import '../../config/theme_extension.dart';
import '../common_widgets/scale_on_hover.dart';
import '../custom/digital_rain.dart';
import '../projects/page_projects.dart';
import '../skill_set/page_skill_set.dart';
import 'appBar/app_bar_home.dart';
import 'music_control_panel.dart';
import 'terminal/view_terminal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<String?> _consoleMessage = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Stack(children: [
        const DigitalRain(),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 800,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 16 / 10,
                      child: Card(
                        color: Colors.white.withOpacity(0.3),
                        elevation: 2,
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
                                        onHover: (onHover) {
                                          if (onHover) {
                                            _consoleMessage.value =
                                                S.of(context).aboutMeMessage;
                                          } else {
                                            _consoleMessage.value = null;
                                          }
                                        },
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const PageAboutMe()),
                                          );
                                        },
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
                                        onHover: (onHover) {
                                          if (onHover) {
                                            _consoleMessage.value =
                                                S.of(context).skillSetMessage;
                                          } else {
                                            _consoleMessage.value = null;
                                          }
                                        },
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SkillSetPage()),
                                          );
                                        },
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
                                child: ScaleOnHover(
                                  onHover: (onHover) {
                                    if (onHover) {
                                      _consoleMessage.value =
                                          S.of(context).projectsMessage;
                                    } else {
                                      _consoleMessage.value = null;
                                    }
                                  },
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PageProjects()),
                                    );
                                  },
                                  child: FittedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const FlutterLogo(
                                          size: 50,
                                          style: FlutterLogoStyle.markOnly,
                                          duration: Duration(seconds: 0),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          S.of(context).developer,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder(
                    valueListenable: _consoleMessage,
                    builder: (_, consoleMessage, ___) {
                      return TerminalView(
                        message: consoleMessage,
                      );
                    }),
              ],
            ),
          ),
        ),
      ]),
      floatingActionButton: MouseRegion(
        onEnter: (_) {
          _consoleMessage.value = S.of(context).musicTooltip;
        },
        onExit: (_) {
          _consoleMessage.value = null;
        },
        child: FloatingActionButton(
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
      ),
    );
  }
}

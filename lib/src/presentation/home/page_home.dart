import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:portfolio/src/presentation/about_me/page_about_me.dart';
import 'package:portfolio/src/presentation/home/button_option_menu_control.dart';
import 'package:portfolio/src/presentation/projects/page_projects.dart';

import '../../../generated/l10n.dart';
import '../../config/theme_extension.dart';
import '../skill_set/page_skill_set.dart';
import 'appBar/app_bar_home.dart';
import 'enum_stage_level.dart';
import 'music_control/view_music_control.dart';
import 'terminal/view_terminal.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {
  StageLevel _currentStageLevel = StageLevel.justEntered;

  final ValueNotifier<String> _consoleMessage = ValueNotifier('>');
  String _defaultMessage = '>';

  Offset _heroOffset = const Offset(-2, 0);
  double _heroOpacity = 0.0;

  bool _showOptions = false;
  final List<String> _optionsList = [''];
  bool _optionPressed = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentStageLevel == StageLevel.justEntered) {
        proceedTo(context: context, stageLevel: StageLevel.gavePrecautions);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    proceedTo(context: context, stageLevel: _currentStageLevel);

    return Scaffold(
      appBar: const AppBarHome(),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Column(
                  children: [
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: AnimatedOpacity(
                          opacity: _heroOpacity,
                          duration: const Duration(seconds: 1),
                          child: AnimatedSlide(
                            offset: _heroOffset,
                            duration: _currentStageLevel.level < 3
                                ? const Duration(seconds: 1)
                                : const Duration(milliseconds: 300),
                            child: Image.asset('images/hero.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                        flex: 1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: AnimatedOpacity(
                              opacity: _showOptions ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 300),
                              child:
                                  StatefulBuilder(builder: (context, setState) {
                                return FittedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          constraints: const BoxConstraints(
                                              maxHeight: 40),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          switch (_currentIndex) {
                                            case 0:
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PageAboutMe(),
                                                  fullscreenDialog: true,
                                                ),
                                              );
                                            case 1:
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PageSkillSet(),
                                                  fullscreenDialog: true,
                                                ),
                                              );
                                            case 2:
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PageProjects(),
                                                  fullscreenDialog: true,
                                                ),
                                              );
                                            default:
                                              UnimplementedError();
                                          }
                                        },
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onEnter: (_) {
                                            setState(() {
                                              _optionPressed = true;
                                            });
                                            switch (_currentIndex) {
                                              case 0:
                                                _consoleMessage.value = S
                                                    .of(context)
                                                    .messageOption1Hover;
                                              case 1:
                                                _consoleMessage.value = S
                                                    .of(context)
                                                    .messageOption2Hover;
                                              case 2:
                                                _consoleMessage.value = S
                                                    .of(context)
                                                    .messageOption3Hover;
                                              default:
                                                UnimplementedError();
                                            }
                                          },
                                          onExit: (_) {
                                            setState(() {
                                              _optionPressed = false;
                                            });

                                            _consoleMessage.value =
                                                _defaultMessage;
                                          },
                                          child: AnimatedContainer(
                                            width: 350,
                                            height: 100,
                                            padding: const EdgeInsets.all(12.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                boxShadow: _optionPressed
                                                    ? null
                                                    : [
                                                        const BoxShadow(
                                                          blurRadius: 4.0,
                                                          offset:
                                                              Offset(-2, -2),
                                                          color: Colors.white38,
                                                        ),
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          offset: const Offset(
                                                              2, 2),
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .shadow,
                                                        ),
                                                      ]),
                                            duration: const Duration(
                                                milliseconds: 150),
                                            child: AnimatedSwitcher(
                                              duration: const Duration(
                                                  milliseconds: 250),
                                              layoutBuilder: (widget, widgets) {
                                                if (widget != null) {
                                                  widgets = widgets.toList()
                                                    ..add(widget);
                                                }
                                                return Stack(
                                                  alignment: Alignment.center,
                                                  children: widgets,
                                                );
                                              },
                                              child: Text(
                                                _optionsList[_currentIndex],
                                                key: ValueKey<String>(
                                                    '${DateTime.now()}'),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .extension<
                                                                ExtensionColors>()!
                                                            .terminalTextColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ButtonOptionMenuControl(
                                              isLeft: true,
                                              onTap: () {
                                                setState(() {
                                                  _currentIndex =
                                                      (_currentIndex + 2) % 3;
                                                });
                                              }),
                                          ButtonOptionMenuControl(
                                              isLeft: false,
                                              onTap: () {
                                                setState(() {
                                                  _currentIndex =
                                                      (_currentIndex + 1) % 3;
                                                });
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ValueListenableBuilder(
                valueListenable: _consoleMessage,
                builder: (context, consoleMessage, ___) {
                  StageLevel nextLevel;
                  switch (_currentStageLevel) {
                    case StageLevel.justEntered:
                      nextLevel = StageLevel.gavePrecautions;
                    case StageLevel.gavePrecautions:
                      nextLevel = StageLevel.heroArrives;
                    case StageLevel.heroArrives:
                      nextLevel = StageLevel.introduceMyself;
                    case StageLevel.introduceMyself:
                      nextLevel = StageLevel.introduceMyself;
                  }

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
                    child: ViewTerminal(
                      message: consoleMessage,
                      clickable: _currentStageLevel.clickable,
                      onTap: () {
                        proceedTo(context: context, stageLevel: nextLevel);
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: MouseRegion(
        onEnter: (_) {
          _consoleMessage.value = S.of(context).messageMusicHover;
        },
        onExit: (_) {
          _consoleMessage.value = _defaultMessage;
        },
        child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: false,
                builder: (BuildContext context) {
                  return const ViewMusicControl();
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

  void proceedTo(
      {required BuildContext context, required StageLevel stageLevel}) {
    setState(() {
      _currentStageLevel = stageLevel;
      switch (stageLevel) {
        case StageLevel.justEntered:
          break;
        case StageLevel.gavePrecautions:
          _defaultMessage = S.of(context).messageLevelOne;
          _consoleMessage.value = _defaultMessage;
        case StageLevel.heroArrives:
          _heroOffset = Offset.zero;
          _heroOpacity = 1.0;
          _defaultMessage = S.of(context).messageLevelTwo;
          _consoleMessage.value = _defaultMessage;
        case StageLevel.introduceMyself:
          _heroOffset = const Offset(-0.7, 0);
          _showOptions = true;
          _defaultMessage = S.of(context).messageLevelThree;
          _consoleMessage.value = _defaultMessage;
          _optionsList.clear();
          _optionsList.add(S.of(context).option1);
          _optionsList.add(S.of(context).option2);
          _optionsList.add(S.of(context).option3);
      }
    });
  }
}
/*
Stack(children: [
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
                                      child: WidgetScaleOnHover(
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
                                      child: WidgetScaleOnHover(
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
                                                    const PageSkillSet()),
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
                                child: WidgetScaleOnHover(
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
                      return ViewTerminal(
                        message: consoleMessage,
                      );
                    }),
              ],
            ),
          ),
        ),
      ]),



 */

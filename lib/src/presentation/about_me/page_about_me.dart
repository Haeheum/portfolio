import 'dart:math';

import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../common_widgets/app_bar_terminal.dart';
import '../home/button_option_menu_control.dart';
import 'model_achievement.dart';
import 'view_page_item.dart';

class PageAboutMe extends StatefulWidget {
  const PageAboutMe({super.key});

  @override
  State<PageAboutMe> createState() => _PageAboutMeState();
}

class _PageAboutMeState extends State<PageAboutMe> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  double _currentIndex = 0.0;

  final List<Achievement> _achievements = [];

  void _listener() {
    setState(() {
      if (_pageController.hasClients) {
        setState(() {
          _currentIndex = _pageController.page!;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_listener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _achievements
      ..clear()
      ..add(
        Achievement(
            index: 0,
            assetPath: 'assets/images/baby.png',
            achievedDate: DateTime(1994, 7),
            description: S.of(context).birthdayDescription),
      )
      ..add(
        Achievement(
            index: 1,
            assetPath: 'assets/images/army.png',
            achievedDate: DateTime(2021, 5),
            description: S.of(context).armyDescription),
      )
      ..add(
        Achievement(
            index: 2,
            assetPath: 'assets/images/knu.png',
            achievedDate: DateTime(2022, 9),
            description: S.of(context).knuDescription),
      )
      ..add(
        Achievement(
            index: 3,
            assetPath: 'assets/images/flutter.png',
            achievedDate: DateTime(2023, 1),
            description: S.of(context).flutterDescription),
      )
      ..add(
        Achievement(
            index: 4,
            assetPath: 'assets/images/company.webp',
            achievedDate: DateTime(2023, 5),
            description: S.of(context).companyDescription),
      )
      ..add(
        Achievement(
            index: 5,
            assetPath: 'assets/images/toeic.png',
            achievedDate: DateTime(2023, 12),
            description: S.of(context).ybmDescription),
      )
      ..add(
        Achievement(
            index: 6,
            assetPath: 'assets/images/lol.png',
            achievedDate: DateTime(2024, 4),
            description: S.of(context).lolDescription),
      )
      ..add(
        Achievement(
            index: 7,
            assetPath: 'assets/images/gisa.png',
            achievedDate: DateTime(2024, 6),
            description: S.of(context).gisaDescription),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        appBar: AppBarTerminal(appBarTitle: S.of(context).aboutMe),
        body: CustomScrollView(
          slivers: [
            SliverMainAxisGroup(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  title: Text(S.of(context).headerChronicle),
                  backgroundColor: Colors.transparent,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height / 2,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 5,
                          child: PageView.builder(
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              if (index < _currentIndex) {
                                double angle = (index - _currentIndex) * 80;

                                if(index - _currentIndex < -1 ){
                                  angle = -80;
                                }

                                return Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.01)
                                    ..rotateX(angle * pi / 180),
                                  alignment: FractionalOffset.bottomCenter,
                                  child: ViewPageItem(
                                      achievement: _achievements[index]),
                                );
                              } else {
                                return ViewPageItem(
                                    achievement: _achievements[index]);
                              }
                            },
                            itemCount: _achievements.length,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonOptionMenuControl(
                                  isLeft: true,
                                  onTap: () {
                                    if (_currentIndex.floor() == 0) {
                                      return;
                                    }
                                    _currentIndex = _currentIndex.floor() - 1;
                                    _pageController.animateToPage(
                                        _currentIndex.toInt(),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                ),
                                const SizedBox(width: 12),
                                ButtonOptionMenuControl(
                                  isLeft: false,
                                  onTap: () {
                                    if (_currentIndex ==
                                        _achievements.length - 1) {
                                      return;
                                    }
                                    _currentIndex = _currentIndex.ceil() + 1;

                                    _pageController.animateToPage(
                                        _currentIndex.toInt(),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
              ),
            )
          ],
        ),
      ),
    );
  }
}

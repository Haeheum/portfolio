import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/src/presentation/portfolio_items/flash_effect.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';
import '../../config/theme_extension.dart';
import '../../data/image_repository.dart';
import '../../util/debounce_manager.dart';
import '../common_widgets/button_page_navigation.dart';
import '../portfolio_items/confetti.dart';
import '../portfolio_items/fetch_image.dart';
import '../portfolio_items/frame_portfolio_item.dart';
import '../portfolio_items/interactive_plate.dart';
import '../portfolio_items/shader_water.dart';
import '../portfolio_items/shimmer_effect.dart';
import '../portfolio_items/sitting_me.dart';
import '../portfolio_items/sun_moon_switch.dart';
import '../portfolio_items/target_plate.dart';
import 'app_bar/app_bar_home.dart';
import 'music_control/view_music_control.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  double _currentPage = 0.0;
  int _toPage = 0;

  final List<Widget> _portfolioItems = [];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_listener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ImageRepository().preCacheImages(context);
    _loadPortfolioItems();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  double angle = (index - _currentPage) * 45;
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.01)
                      ..rotateZ(angle * pi / 180)
                      ..scale(max(1 - (index - _currentPage).abs(), 0.5)),
                    alignment: FractionalOffset.bottomCenter,
                    child: _portfolioItems[index],
                  );
                },
                itemCount: _portfolioItems.length,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPageNavigation(
                  isLeft: true,
                  onTap: () {
                    if (_toPage == 0) {
                      return;
                    }
                    _toPage = _toPage - 1;
                    DebounceManager.run(action: () {
                      _pageController
                          .animateToPage(_toPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut)
                          .then((_) {});
                    });
                  },
                ),
                const SizedBox(width: 12),
                Text(
                  '${_toPage + 1}/${_portfolioItems.length}',
                  style: TextStyle(
                    color: Theme.of(context)
                        .extension<ExtensionColors>()!
                        .textColor,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(width: 12),
                ButtonPageNavigation(
                  isLeft: false,
                  onTap: () {
                    if (_toPage == _portfolioItems.length - 1) {
                      return;
                    }
                    _toPage = _toPage + 1;
                    DebounceManager.run(action: () {
                      _pageController
                          .animateToPage(_toPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut)
                          .then((_) {});
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
        child: const Icon(Icons.music_note_rounded),
      ),
    );
  }

  void _listener() {
    setState(() {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = _pageController.page!;
        });
      }
    });
  }

  void _loadPortfolioItems() async {
    _portfolioItems
      ..clear()

      ..add(
        FramePortfolioItem(
          title: S.of(context).introTitle,
          body: S.of(context).introBody,
          child: const SittingMe(),
        ),
      )
      ..add(
        FramePortfolioItem(
          title: S.of(context).sunMoonSwitchTitle,
          body: S.of(context).sunMoonSwitchBody,
          onTap: () {
            launchUrl(Uri.parse('https://www.youtube.com/watch?v=5qHHm7ooavo'));
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SunMoonSwitch(
              onChanged: (_) {},
            ),
          ),
        ),
      )
      ..add(
        FramePortfolioItem(
          title: S.of(context).shimmerEffectTitle,
          body: S.of(context).shimmerEffectBody,
          child: const WidgetSampleShimmer(),
        ),
      )
      ..add(
        FramePortfolioItem(
          title: S.of(context).confettiTitle,
          body: S.of(context).confettiBody,
          child: const Confetti(),
        ),
      )
      ..add(
        FramePortfolioItem(
          title: S.of(context).circleCollisionTitle,
          body: S.of(context).circleCollisionBody,
          child: const TargetPlate(),
        ),
      )
      ..add(
        FramePortfolioItem(
          title: S.of(context).shaderWaterTitle,
          body: S.of(context).shaderWaterBody,
          child: const ShaderWater(),
        ),
      )
      ..add(
        FramePortfolioItem(
          title: S.of(context).interactivePlateTitle,
          body: S.of(context).interactivePlateBody,
          child: const InteractivePlate(),
        ),
      )..add(
      FramePortfolioItem(
        title: S.of(context).fetchImageTitle,
        body: S.of(context).fetchImageBody,
        child: const FetchImage(),
      ),
    )..add(
      FramePortfolioItem(
        title: S.of(context).flashEffectTitle,
        body: S.of(context).flashEffectBody,
        child: const FlashEffect(),
      ),
    )
    ;
  }
}

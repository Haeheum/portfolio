import 'package:flutter/material.dart';

import '../custom/confetti.dart';
import '../custom/shimmer_effect.dart';
import '../custom/sun_moon_switch.dart';
import '../custom/target_plate.dart';
import 'grid_item.dart';

class SkillSetPage extends StatelessWidget {
  const SkillSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Shimmer(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverGrid.extent(
                maxCrossAxisExtent: 600,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                children: [
                  const ShimmerLoading(child: GridItem()),
                  const ShimmerLoading(child: GridItem()),
                  const ShimmerLoading(child: GridItem()),
                  GridItem(child: SunMoonSwitch(onChanged: (_) {})),
                  const GridItem(child: Confetti()),
                  const GridItem(paddingValue: 0, child: TargetPlate()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

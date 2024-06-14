import 'package:flutter/material.dart';
import 'package:portfolio/src/presentation/custom/target_plate.dart';

import '../custom/confetti.dart';
import '../custom/sun_moon_switch.dart';
import 'grid_item.dart';

class StrengthPage extends StatelessWidget {
  const StrengthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverGrid.extent(
              maxCrossAxisExtent: 600,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              children: [
                GridItem(child: SunMoonSwitch(onChanged: (_) {})),
                const GridItem(child: Confetti()),
                const GridItem(paddingValue: 0, child: TargetPlate()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

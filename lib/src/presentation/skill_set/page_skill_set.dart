import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../common_widgets/app_bar_terminal.dart';
import '../custom/confetti.dart';
import '../custom/shimmer_effect.dart';
import '../custom/sun_moon_switch.dart';
import '../custom/target_plate.dart';
import 'grid_item_skill_set.dart';

class PageSkillSet extends StatelessWidget {
  const PageSkillSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        appBar: AppBarTerminal(appBarTitle: S.of(context).skillSet),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomScrollView(
            slivers: [
              SliverGrid.extent(
                maxCrossAxisExtent: 600,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                children: [
                  const GridItemSkillSet(child: WidgetSampleShimmer()),
                  GridItemSkillSet(child: SunMoonSwitch(onChanged: (_) {})),
                  const GridItemSkillSet(child: Confetti()),
                  const GridItemSkillSet(paddingValue: 0, child: TargetPlate()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

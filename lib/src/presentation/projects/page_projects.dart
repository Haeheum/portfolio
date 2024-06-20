import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../common_widgets/app_bar_terminal.dart';

class PageProjects extends StatelessWidget {
  const PageProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        appBar: AppBarTerminal(appBarTitle: S.of(context).projects),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomScrollView(
            slivers: [
              SliverGrid.extent(
                maxCrossAxisExtent: 600,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                children: const [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

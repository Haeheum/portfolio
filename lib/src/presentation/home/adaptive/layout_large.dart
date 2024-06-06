import 'package:flutter/material.dart';
import 'package:resume/src/presentation/home/home_main_view.dart';

import '../home_app_bar.dart';
import '../home_side_menu.dart';

class LayoutLarge extends StatelessWidget {
  const LayoutLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SideMenu(),
        Expanded(
          child: Scaffold(
            appBar: HomeAppBar(),
            body: MainView(),
          ),
        ),
      ],
    );
  }
}

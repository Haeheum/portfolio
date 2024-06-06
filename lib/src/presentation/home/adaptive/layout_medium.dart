import 'package:flutter/material.dart';
import 'package:resume/src/presentation/home/home_main_view.dart';
import 'package:resume/src/presentation/home/music_control_widget.dart';

import '../home_app_bar.dart';

class LayoutMedium extends StatelessWidget {
  const LayoutMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: MainView(),
      bottomNavigationBar: MusicControlWidget(),
    );
  }
}

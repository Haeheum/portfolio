import 'package:flutter/material.dart';

import '../common_widgets/app_bar_terminal.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        appBar: const AppBarTerminal(),
        body: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

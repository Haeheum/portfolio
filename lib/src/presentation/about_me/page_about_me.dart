import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../common_widgets/app_bar_terminal.dart';

class PageAboutMe extends StatelessWidget {
  const PageAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        appBar: AppBarTerminal(appBarTitle: S.of(context).aboutMe),
        body: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

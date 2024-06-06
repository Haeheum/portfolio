import 'package:flutter/material.dart';

import 'adaptive/layout_large.dart';
import 'adaptive/layout_medium.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    if (screenSize.width >= 840) {
      return const LayoutLarge();
    } else {
      return const LayoutMedium();
    }
  }
}

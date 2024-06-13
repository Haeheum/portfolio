import 'package:flutter/material.dart';

import '../custom/sun_moon_switch.dart';

class StrengthPage extends StatelessWidget {
  const StrengthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(24),
        child: SunMoonSwitch(
          onChanged: (bool value) {},
        ),
      ),
    );
  }
}

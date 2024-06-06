import 'dart:developer' as dev;


import 'package:flutter/material.dart';

import '../custom/sun_moon_switch.dart';

class SecondPageView extends StatelessWidget {
  const SecondPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 115,
          child: SunMoonSwitch(
            onChanged: (bool value){
              dev.log('test ${value.toString()}');
            }
          )),
    );
  }
}

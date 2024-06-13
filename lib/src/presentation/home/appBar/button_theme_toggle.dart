import 'package:flutter/material.dart';

import '../../../../main.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: MainApp.of(context).toggleThemeMode,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHover = false;
          });
        },
        child: AnimatedContainer(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isHover ? Theme.of(context).hoverColor : null,
            borderRadius: BorderRadius.circular(20.0),
          ),
          width: 40.0,
          height: 40.0,
          duration: const Duration(milliseconds: 200),
          child: Icon(switch (Theme.of(context).brightness) {
            Brightness.light => Icons.nightlight_round,
            Brightness.dark => Icons.wb_sunny_rounded
          }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_extension.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: const Color(0xFF2184DC),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xFF2F2E36)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF2F2E36),
    backgroundColor: Color(0xFFF5CE56),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF2F2E36)),
  iconButtonTheme: const IconButtonThemeData(),
  sliderTheme: const SliderThemeData(
    activeTrackColor: Color(0xFFF5CE56),
    inactiveTrackColor: Color(0xFFA9A9A9),
    thumbColor: Color(0xFFF5CE56),
  ),
  textTheme: GoogleFonts.juaTextTheme(),
  tooltipTheme: TooltipThemeData(
      textStyle: GoogleFonts.jua()
          .copyWith(fontSize: 20, color: const Color(0xFFEDEBEE))),
  extensions: const [
    ExtensionColors(
      skyColor: Color(0xFF51A4D6),
      rainColor: Color(0xCBFFFFFF),
      cardBackgroundColor: Color(0xFFF5CE56),
      backgroundColor: Color(0xFFFFE9A6),
      textColor: Color(0xFF2F2E36),
    ),
  ],
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF8AC1EF),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xFFEDEBEE)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFFEDEBEE),
    backgroundColor: Color(0xFF466C93),
  ),
  iconTheme: const IconThemeData(color: Color(0xFFEDEBEE)),
  sliderTheme: const SliderThemeData(
    activeTrackColor: Color(0xFF466C93),
    inactiveTrackColor: Color(0xFFA9A9A9),
    thumbColor: Color(0xFF466C93),
  ),
  textTheme: GoogleFonts.juaTextTheme(),
  tooltipTheme: TooltipThemeData(
      textStyle: GoogleFonts.jua()
          .copyWith(fontSize: 20, color: const Color(0xFF2F2E36))),
  extensions: const [
    ExtensionColors(
      skyColor: Color(0xFF152F52),
      rainColor: Color(0x99F4F4F5),
      cardBackgroundColor: Color(0xFF466C93),
      backgroundColor: Color(0xFF151319),
      textColor: Color(0xFFEDEBEE),
    ),
  ],
);

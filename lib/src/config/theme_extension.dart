import 'package:flutter/material.dart';

class ExtensionColors extends ThemeExtension<ExtensionColors> {
  const ExtensionColors({
    required this.skyColor,
    required this.rainColor,
    required this.cardBackgroundColor,
    required this.backgroundColor,
    required this.textColor,
  });

  final Color? skyColor;
  final Color? rainColor;
  final Color? cardBackgroundColor;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  ExtensionColors copyWith({
    Color? skyColor,
    Color? rainColor,
    Color? cardBackgroundColor,
    Color? backgroundColor,
    Color? textColor,
    Color? matrixShadowColor,
  }) {
    return ExtensionColors(
      skyColor: skyColor ?? this.skyColor,
      rainColor: rainColor ?? this.rainColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ExtensionColors lerp(ExtensionColors? other, double t) {
    if (other is! ExtensionColors) {
      return this;
    }
    return ExtensionColors(
      skyColor: Color.lerp(skyColor, other.skyColor, t),
      rainColor: Color.lerp(rainColor, other.rainColor, t),
      cardBackgroundColor: Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}

import 'package:flutter/material.dart';

class ExtensionColors extends ThemeExtension<ExtensionColors> {
  const ExtensionColors({
    required this.matrixTitleColor,
    required this.matrixShadowColor,
  });

  final Color? matrixTitleColor;
  final Color? matrixShadowColor;

  @override
  ExtensionColors copyWith(
      {Color? matrixTitleColor, Color? matrixShadowColor}) {
    return ExtensionColors(
      matrixTitleColor: matrixTitleColor ?? this.matrixTitleColor,
      matrixShadowColor: matrixShadowColor ?? this.matrixShadowColor,
    );
  }

  @override
  ExtensionColors lerp(ExtensionColors? other, double t) {
    if (other is! ExtensionColors) {
      return this;
    }
    return ExtensionColors(
      matrixTitleColor: Color.lerp(matrixTitleColor, other.matrixTitleColor, t),
      matrixShadowColor:
          Color.lerp(matrixShadowColor, other.matrixShadowColor, t),
    );
  }
}

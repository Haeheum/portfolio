import 'package:flutter/material.dart';

@immutable
class AppState {
  final String languageCode;
  final ThemeMode themeMode;

  const AppState({required this.languageCode, required this.themeMode});

  AppState copyWith({
    String? languageCode,
    ThemeMode? themeMode,
  }) {
    return AppState(
        languageCode: languageCode ?? this.languageCode,
        themeMode: themeMode ?? this.themeMode);
  }
}

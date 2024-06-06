import 'package:flutter/material.dart';

class AppStateModel extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode themeMode = ThemeMode.light;

  setLanguageCode(String newLanguageCode) {
    if (languageCode != newLanguageCode) {
      languageCode = newLanguageCode;
      notifyListeners();
    }
  }

  toggleThemeMode() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../model/app_state_model.dart';

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({super.key, required this.child});

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _appState = const AppState(languageCode: 'ko', themeMode: ThemeMode.light);

  setLanguageCode(String newLanguageCode) {
    if (_appState.languageCode != newLanguageCode) {
      setState(() {
        _appState = _appState.copyWith(languageCode: newLanguageCode);
      });
    }
  }

  toggleThemeMode() {
    setState(() {
      if (_appState.themeMode == ThemeMode.light) {
        _appState = _appState.copyWith(themeMode: ThemeMode.dark);
      } else {
        _appState = _appState.copyWith(themeMode: ThemeMode.light);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(appState: _appState, child: widget.child);
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope({
    super.key,
    required this.appState,
    required super.child,
  });

  final AppState appState;

  static AppState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppStateScope>()!
        .appState;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return !identical(appState, oldWidget.appState);
  }
}

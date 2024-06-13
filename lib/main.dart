import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/find_locale.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/src/util/global_methods.dart';

import 'generated/l10n.dart';
import 'src/config/theme.dart';
import 'src/model/app_state_model.dart';
import 'src/presentation/scope/app_state_scope.dart';
import 'src/presentation/audio/audio_controller.dart';
import 'src/presentation/home/page_home.dart';

void main() async {
  await findSystemLocale();
  runApp(
    const AudioController(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static MainAppState of(BuildContext context) {
    return context.findAncestorStateOfType<MainAppState>()!;
  }

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  late final AppStateModel _appState;

  void setLanguageCode(String newLanguageCode) {
    _appState.setLanguageCode(newLanguageCode);
  }

  void toggleThemeMode() {
    _appState.toggleThemeMode();
  }

  @override
  void initState() {
    super.initState();

    Locale appLocale = kGetLocaleFromLocaleInfo(Intl.systemLocale);
    debugPrint('defaultLocale: (${appLocale.languageCode},${appLocale.countryCode})');

    _appState = AppStateModel(appLocale: appLocale, themeMode: ThemeMode.system);

  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      notifier: _appState,
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: AppStateScope.of(context).appLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const HomePage(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: AppStateScope.of(context).themeMode,
        );
      }),
    );
  }
}

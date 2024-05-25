import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/presentation/app_state_manager.dart';
import 'src/presentation/audio/audio_manager.dart';
import 'src/presentation/home.dart';

void main() {
  runApp(
    const AudioWidget(
      child: AppStateWidget(
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(AppStateScope.of(context).languageCode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Home(),
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFFFCE00),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color(0xFFFFCE00),
        ),
      ),
      themeMode: AppStateScope.of(context).themeMode,
    );
  }
}

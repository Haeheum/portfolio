// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading background musics`
  String get messageAudioLoading {
    return Intl.message(
      'Loading background musics',
      name: 'messageAudioLoading',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio of Haeheum's taste`
  String get introTitle {
    return Intl.message(
      'Portfolio of Haeheum\'s taste',
      name: 'introTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to my portfolio. You can play some of my favorite songs at the bottom end of the screen. Loading might require some time but it will bring joy.`
  String get introBody {
    return Intl.message(
      'Welcome to my portfolio. You can play some of my favorite songs at the bottom end of the screen. Loading might require some time but it will bring joy.',
      name: 'introBody',
      desc: '',
      args: [],
    );
  }

  /// `Custom widget`
  String get sunMoonSwitchTitle {
    return Intl.message(
      'Custom widget',
      name: 'sunMoonSwitchTitle',
      desc: '',
      args: [],
    );
  }

  /// `While watching YouTube Shorts, I came across to a funny video related to development. The video was so hilarious that I decided to implement it to experience the anguish myself. Custom widget takes a lot of effort, but they are certainly worth it [Click to see the video]`
  String get sunMoonSwitchBody {
    return Intl.message(
      'While watching YouTube Shorts, I came across to a funny video related to development. The video was so hilarious that I decided to implement it to experience the anguish myself. Custom widget takes a lot of effort, but they are certainly worth it [Click to see the video]',
      name: 'sunMoonSwitchBody',
      desc: '',
      args: [],
    );
  }

  /// `Skeleton UI`
  String get shimmerEffectTitle {
    return Intl.message(
      'Skeleton UI',
      name: 'shimmerEffectTitle',
      desc: '',
      args: [],
    );
  }

  /// `When a screen is loading, Skeleton UI makes me feel like its almost there. Delicate details like this will reach the user`
  String get shimmerEffectBody {
    return Intl.message(
      'When a screen is loading, Skeleton UI makes me feel like its almost there. Delicate details like this will reach the user',
      name: 'shimmerEffectBody',
      desc: '',
      args: [],
    );
  }

  /// `Confetti`
  String get confettiTitle {
    return Intl.message(
      'Confetti',
      name: 'confettiTitle',
      desc: '',
      args: [],
    );
  }

  /// `With custom paint, so many things are possible. Various attributes for each falling paper make it seems very realistic.`
  String get confettiBody {
    return Intl.message(
      'With custom paint, so many things are possible. Various attributes for each falling paper make it seems very realistic.',
      name: 'confettiBody',
      desc: '',
      args: [],
    );
  }

  /// `Circle collision detection`
  String get circleCollisionTitle {
    return Intl.message(
      'Circle collision detection',
      name: 'circleCollisionTitle',
      desc: '',
      args: [],
    );
  }

  /// `I have implemented circle collision detection. Well known example of this concept is the game brick breaker. I have used this concept to show shiny effect over a card image with the gravity sensor of a device. `
  String get circleCollisionBody {
    return Intl.message(
      'I have implemented circle collision detection. Well known example of this concept is the game brick breaker. I have used this concept to show shiny effect over a card image with the gravity sensor of a device. ',
      name: 'circleCollisionBody',
      desc: '',
      args: [],
    );
  }

  /// `Graphic effect`
  String get shaderWaterTitle {
    return Intl.message(
      'Graphic effect',
      name: 'shaderWaterTitle',
      desc: '',
      args: [],
    );
  }

  /// `I think Shaders are the final boss for visual effects. Graphic language is hard but you cannot give up the cool effects.`
  String get shaderWaterBody {
    return Intl.message(
      'I think Shaders are the final boss for visual effects. Graphic language is hard but you cannot give up the cool effects.',
      name: 'shaderWaterBody',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

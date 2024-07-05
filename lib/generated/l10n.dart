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

  /// `Haeheum's portfolio`
  String get introTitle {
    return Intl.message(
      'Haeheum\'s portfolio',
      name: 'introTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to my portfolio. You can play my favorite songs from the bottom end button. Loading is required, but it would be great if you could listen.`
  String get introBody {
    return Intl.message(
      'Welcome to my portfolio. You can play my favorite songs from the bottom end button. Loading is required, but it would be great if you could listen.',
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

  /// `I ended up making it after watching a video on youtube. Click to see the video. As a developer, I think making custom widgets is one of the toughest works. Its time cost is hard to predict and development process is hard. But it does look amazing.`
  String get sunMoonSwitchBody {
    return Intl.message(
      'I ended up making it after watching a video on youtube. Click to see the video. As a developer, I think making custom widgets is one of the toughest works. Its time cost is hard to predict and development process is hard. But it does look amazing.',
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

  /// `Skeleton UI has power to make waiting less burdensome.`
  String get shimmerEffectBody {
    return Intl.message(
      'Skeleton UI has power to make waiting less burdensome.',
      name: 'shimmerEffectBody',
      desc: '',
      args: [],
    );
  }

  /// `Custom paint`
  String get confettiTitle {
    return Intl.message(
      'Custom paint',
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

  /// `I have implemented circle collision detection. Well known example of this concept is the game brick breaker. I have applied this concept in a project. `
  String get circleCollisionBody {
    return Intl.message(
      'I have implemented circle collision detection. Well known example of this concept is the game brick breaker. I have applied this concept in a project. ',
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

  /// `Shaders can make cool graphics like games. So I started studying shader language.`
  String get shaderWaterBody {
    return Intl.message(
      'Shaders can make cool graphics like games. So I started studying shader language.',
      name: 'shaderWaterBody',
      desc: '',
      args: [],
    );
  }

  /// `Interactive plate`
  String get interactivePlateTitle {
    return Intl.message(
      'Interactive plate',
      name: 'interactivePlateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rotate on hover.`
  String get interactivePlateBody {
    return Intl.message(
      'Rotate on hover.',
      name: 'interactivePlateBody',
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

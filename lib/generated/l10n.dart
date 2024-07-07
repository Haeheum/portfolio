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

  /// `Welcome to my portfolio. Each page has a special item implemented. If you move your mouse with in the area, The character will stare. Oh, and you can play my favorite songs from the bottom end button. Loading is required, but it would be great if you could listen.`
  String get introBody {
    return Intl.message(
      'Welcome to my portfolio. Each page has a special item implemented. If you move your mouse with in the area, The character will stare. Oh, and you can play my favorite songs from the bottom end button. Loading is required, but it would be great if you could listen.',
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

  /// `I made this widget after watching a funny video on youtube. Click here to see the video. As a developer, making custom widget is one of the toughest tasks. But it does look amazing.`
  String get sunMoonSwitchBody {
    return Intl.message(
      'I made this widget after watching a funny video on youtube. Click here to see the video. As a developer, making custom widget is one of the toughest tasks. But it does look amazing.',
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

  /// `Shaders can make cool graphic effects like games.`
  String get shaderWaterBody {
    return Intl.message(
      'Shaders can make cool graphic effects like games.',
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

  /// `Network image loading`
  String get fetchImageTitle {
    return Intl.message(
      'Network image loading',
      name: 'fetchImageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Network image loading simulation. You can set the result with the switch.`
  String get fetchImageBody {
    return Intl.message(
      'Network image loading simulation. You can set the result with the switch.',
      name: 'fetchImageBody',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load image.`
  String get fetchImageErrorText {
    return Intl.message(
      'Failed to load image.',
      name: 'fetchImageErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Load image`
  String get fetchImage {
    return Intl.message(
      'Load image',
      name: 'fetchImage',
      desc: '',
      args: [],
    );
  }

  /// `Area inversion effect`
  String get flashEffectTitle {
    return Intl.message(
      'Area inversion effect',
      name: 'flashEffectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Inversion effect is applied on the background image along to the mouse pointer. Besides inversion, different color, or image can be over drawn.`
  String get flashEffectBody {
    return Intl.message(
      'Inversion effect is applied on the background image along to the mouse pointer. Besides inversion, different color, or image can be over drawn.',
      name: 'flashEffectBody',
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

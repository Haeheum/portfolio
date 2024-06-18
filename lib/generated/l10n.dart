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

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `DEVELOPER`
  String get developer {
    return Intl.message(
      'DEVELOPER',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `HAEHEUM JO`
  String get myName {
    return Intl.message(
      'HAEHEUM JO',
      name: 'myName',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get aboutMe {
    return Intl.message(
      'About me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Skill set`
  String get skillSet {
    return Intl.message(
      'Skill set',
      name: 'skillSet',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message(
      'Projects',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `{date}`
  String myBirthdate(DateTime date) {
    final DateFormat dateDateFormat = DateFormat.yMd(Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    return Intl.message(
      '$dateString',
      name: 'myBirthdate',
      desc: 'My birthdate',
      args: [dateString],
    );
  }

  /// `> Let me introduce you my favorite singer!`
  String get messageMusicHover {
    return Intl.message(
      '> Let me introduce you my favorite singer!',
      name: 'messageMusicHover',
      desc: '',
      args: [],
    );
  }

  /// `> Good day. Thank you for visiting my portfolio website. This portfolio has been designed and optimized for the desktop web environment. In order to provide you with the best user experience, please access from a desktop web browser. [Press]`
  String get messageLevelOne {
    return Intl.message(
      '> Good day. Thank you for visiting my portfolio website. This portfolio has been designed and optimized for the desktop web environment. In order to provide you with the best user experience, please access from a desktop web browser. [Press]',
      name: 'messageLevelOne',
      desc: '',
      args: [],
    );
  }

  /// `> Hi I am developer Haeheum Jo. You can play music by clicking the music note icon below. You can adjust volume on top appbar. You can also edit language and theme mode. [Press]`
  String get messageLevelTwo {
    return Intl.message(
      '> Hi I am developer Haeheum Jo. You can play music by clicking the music note icon below. You can adjust volume on top appbar. You can also edit language and theme mode. [Press]',
      name: 'messageLevelTwo',
      desc: '',
      args: [],
    );
  }

  /// `> What would you like to know?`
  String get messageLevelThree {
    return Intl.message(
      '> What would you like to know?',
      name: 'messageLevelThree',
      desc: '',
      args: [],
    );
  }

  /// `Tell me about you`
  String get option1 {
    return Intl.message(
      'Tell me about you',
      name: 'option1',
      desc: '',
      args: [],
    );
  }

  /// `Show some flutter skills`
  String get option2 {
    return Intl.message(
      'Show some flutter skills',
      name: 'option2',
      desc: '',
      args: [],
    );
  }

  /// `Project experience?`
  String get option3 {
    return Intl.message(
      'Project experience?',
      name: 'option3',
      desc: '',
      args: [],
    );
  }

  /// `> I would like to be with you. Let me tell you more. `
  String get messageOption1Hover {
    return Intl.message(
      '> I would like to be with you. Let me tell you more. ',
      name: 'messageOption1Hover',
      desc: '',
      args: [],
    );
  }

  /// `> I have a diverse set of skills required for app development, and I have experience in the entire process from system design to deployment. Lately, I have been particularly interested in interaction design. I would be happy to show you some of the beautiful UI views I have implemented.`
  String get messageOption2Hover {
    return Intl.message(
      '> I have a diverse set of skills required for app development, and I have experience in the entire process from system design to deployment. Lately, I have been particularly interested in interaction design. I would be happy to show you some of the beautiful UI views I have implemented.',
      name: 'messageOption2Hover',
      desc: '',
      args: [],
    );
  }

  /// `> I will show you my project experiences. Please check my resume for details.`
  String get messageOption3Hover {
    return Intl.message(
      '> I will show you my project experiences. Please check my resume for details.',
      name: 'messageOption3Hover',
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

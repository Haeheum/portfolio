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

  /// `My playlist`
  String get musicTooltip {
    return Intl.message(
      'My playlist',
      name: 'musicTooltip',
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

  /// `Haeheum Jo`
  String get myName {
    return Intl.message(
      'Haeheum Jo',
      name: 'myName',
      desc: '',
      args: [],
    );
  }

  /// `My milestone`
  String get milestoneTooltip {
    return Intl.message(
      'My milestone',
      name: 'milestoneTooltip',
      desc: '',
      args: [],
    );
  }

  /// `My strength`
  String get strengthTooltip {
    return Intl.message(
      'My strength',
      name: 'strengthTooltip',
      desc: '',
      args: [],
    );
  }

  /// `My projects`
  String get projectsTooltip {
    return Intl.message(
      'My projects',
      name: 'projectsTooltip',
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

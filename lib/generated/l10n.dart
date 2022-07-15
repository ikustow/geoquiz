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

  /// `Start`
  String get start_button_title {
    return Intl.message(
      'Start',
      name: 'start_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Geo quiz`
  String get sign_in_app_bar_title {
    return Intl.message(
      'Geo quiz',
      name: 'sign_in_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Right!`
  String get right_app_bar_title {
    return Intl.message(
      'Right!',
      name: 'right_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Wrong!`
  String get wrong_app_bar_title {
    return Intl.message(
      'Wrong!',
      name: 'wrong_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Go next!`
  String get go_next_title {
    return Intl.message(
      'Go next!',
      name: 'go_next_title',
      desc: '',
      args: [],
    );
  }

  /// `Awesome!`
  String get final_title {
    return Intl.message(
      'Awesome!',
      name: 'final_title',
      desc: '',
      args: [],
    );
  }

  /// `Try again!`
  String get restart_title {
    return Intl.message(
      'Try again!',
      name: 'restart_title',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in_title {
    return Intl.message(
      'Sign in',
      name: 'sign_in_title',
      desc: '',
      args: [],
    );
  }

  /// `Number # `
  String get number_title {
    return Intl.message(
      'Number # ',
      name: 'number_title',
      desc: '',
      args: [],
    );
  }

  /// `Best`
  String get welcome_animate_title_1 {
    return Intl.message(
      'Best',
      name: 'welcome_animate_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Quiz`
  String get welcome_animate_title_2 {
    return Intl.message(
      'Quiz',
      name: 'welcome_animate_title_2',
      desc: '',
      args: [],
    );
  }

  /// `In the`
  String get welcome_animate_title_3 {
    return Intl.message(
      'In the',
      name: 'welcome_animate_title_3',
      desc: '',
      args: [],
    );
  }

  /// `WORLD!`
  String get welcome_animate_title_4 {
    return Intl.message(
      'WORLD!',
      name: 'welcome_animate_title_4',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, `
  String get welcome_text_title {
    return Intl.message(
      'Welcome, ',
      name: 'welcome_text_title',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_bar_title {
    return Intl.message(
      'Home',
      name: 'home_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progress_bar_title {
    return Intl.message(
      'Progress',
      name: 'progress_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about_bar_title {
    return Intl.message(
      'About',
      name: 'about_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progress_appbar_title {
    return Intl.message(
      'Progress',
      name: 'progress_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Done!`
  String get done_task_title {
    return Intl.message(
      'Done!',
      name: 'done_task_title',
      desc: '',
      args: [],
    );
  }

  /// `:(`
  String get not_done_task_title {
    return Intl.message(
      ':(',
      name: 'not_done_task_title',
      desc: '',
      args: [],
    );
  }

  /// `Geo quiz`
  String get home_appbar_title {
    return Intl.message(
      'Geo quiz',
      name: 'home_appbar_title',
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

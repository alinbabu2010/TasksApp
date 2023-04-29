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

  /// `Tasks App`
  String get appName {
    return Intl.message(
      'Tasks App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Tasks App`
  String get appTitle {
    return Intl.message(
      'Flutter Tasks App',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get labelLogin {
    return Intl.message(
      'Login',
      name: 'labelLogin',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get labelCreateAccount {
    return Intl.message(
      'Create account',
      name: 'labelCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get labelEmail {
    return Intl.message(
      'Email',
      name: 'labelEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get labelPassword {
    return Intl.message(
      'Password',
      name: 'labelPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get labelConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'labelConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get labelForgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'labelForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get labelReset {
    return Intl.message(
      'Reset',
      name: 'labelReset',
      desc: '',
      args: [],
    );
  }

  /// `Pending tasks`
  String get labelPendingTasks {
    return Intl.message(
      'Pending tasks',
      name: 'labelPendingTasks',
      desc: '',
      args: [],
    );
  }

  /// `Completed tasks`
  String get labelCompletedTasks {
    return Intl.message(
      'Completed tasks',
      name: 'labelCompletedTasks',
      desc: '',
      args: [],
    );
  }

  /// `Favorite tasks`
  String get labelFavoriteTasks {
    return Intl.message(
      'Favorite tasks',
      name: 'labelFavoriteTasks',
      desc: '',
      args: [],
    );
  }

  /// `Add Task`
  String get labelAddTask {
    return Intl.message(
      'Add Task',
      name: 'labelAddTask',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get labelEditTask {
    return Intl.message(
      'Edit Task',
      name: 'labelEditTask',
      desc: '',
      args: [],
    );
  }

  /// `Task Drawer`
  String get labelTaskDrawer {
    return Intl.message(
      'Task Drawer',
      name: 'labelTaskDrawer',
      desc: '',
      args: [],
    );
  }

  /// `My Tasks`
  String get labelMyTasks {
    return Intl.message(
      'My Tasks',
      name: 'labelMyTasks',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get labelDarkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'labelDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `System Theme`
  String get labelSystemTheme {
    return Intl.message(
      'System Theme',
      name: 'labelSystemTheme',
      desc: '',
      args: [],
    );
  }

  /// `Trash`
  String get labelTrash {
    return Intl.message(
      'Trash',
      name: 'labelTrash',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{1 task} other{{count} tasks}}`
  String taskCount(num count) {
    return Intl.plural(
      count,
      one: '1 task',
      other: '$count tasks',
      name: 'taskCount',
      desc: '',
      args: [count],
    );
  }

  /// `{pending} Pending | {completed} Completed`
  String pendingAndCompletedCount(Object pending, Object completed) {
    return Intl.message(
      '$pending Pending | $completed Completed',
      name: 'pendingAndCompletedCount',
      desc: '',
      args: [pending, completed],
    );
  }

  /// `Title`
  String get labelTitle {
    return Intl.message(
      'Title',
      name: 'labelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get labelDescription {
    return Intl.message(
      'Description',
      name: 'labelDescription',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get labelDeleteAll {
    return Intl.message(
      'Delete All',
      name: 'labelDeleteAll',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid title`
  String get titleErrorMsg {
    return Intl.message(
      'Please enter a valid title',
      name: 'titleErrorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid description`
  String get descriptionErrorMsg {
    return Intl.message(
      'Please enter a valid description',
      name: 'descriptionErrorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get labelCancel {
    return Intl.message(
      'Cancel',
      name: 'labelCancel',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get labelAdd {
    return Intl.message(
      'Add',
      name: 'labelAdd',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get labelSave {
    return Intl.message(
      'Save',
      name: 'labelSave',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get labelEdit {
    return Intl.message(
      'Edit',
      name: 'labelEdit',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get labelFavorite {
    return Intl.message(
      'Favorite',
      name: 'labelFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Unfavorite`
  String get labelUnfavorite {
    return Intl.message(
      'Unfavorite',
      name: 'labelUnfavorite',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get labelDelete {
    return Intl.message(
      'Delete',
      name: 'labelDelete',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get labelRestore {
    return Intl.message(
      'Restore',
      name: 'labelRestore',
      desc: '',
      args: [],
    );
  }

  /// `Delete Forever`
  String get labelDeleteForever {
    return Intl.message(
      'Delete Forever',
      name: 'labelDeleteForever',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get labelSuccess {
    return Intl.message(
      'Success',
      name: 'labelSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get labelError {
    return Intl.message(
      'Error',
      name: 'labelError',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get labelBack {
    return Intl.message(
      'Back',
      name: 'labelBack',
      desc: '',
      args: [],
    );
  }

  /// `Reset your password here`
  String get recoverPasswordIntro {
    return Intl.message(
      'Reset your password here',
      name: 'recoverPasswordIntro',
      desc: '',
      args: [],
    );
  }

  /// `We will send you an email for password reset link.`
  String get recoverPasswordDescription {
    return Intl.message(
      'We will send you an email for password reset link.',
      name: 'recoverPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Password do not match!`
  String get confirmPasswordError {
    return Intl.message(
      'Password do not match!',
      name: 'confirmPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `An email has been sent`
  String get resetPasswordSuccess {
    return Intl.message(
      'An email has been sent',
      name: 'resetPasswordSuccess',
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

part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class UserThemeEvent extends ThemeEvent {
  final bool isDarkTheme;

  UserThemeEvent(this.isDarkTheme);
}

class SystemThemeEvent extends ThemeEvent {
  final bool isSystemTheme;

  SystemThemeEvent(this.isSystemTheme);
}

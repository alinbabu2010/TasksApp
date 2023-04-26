part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class DarkThemeEvent extends ThemeEvent {}

class LightThemeEvent extends ThemeEvent {}

class EnableSystemThemeEvent extends ThemeEvent {}

class DisableSystemThemeEvent extends ThemeEvent {}

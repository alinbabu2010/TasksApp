part of 'theme_bloc.dart';

@immutable
class ThemeState {
  final bool isDarkTheme;
  final bool isSystemTheme;

  const ThemeState(this.isDarkTheme, this.isSystemTheme);

  Map<String, dynamic> toMap() {
    return {'isDarkTheme': isDarkTheme, 'isSystemTheme': isSystemTheme};
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(map['isDarkTheme'] as bool, map['isSystemTheme'] as bool);
  }
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.isDarkTheme, super.isSystemTheme);
}

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(false, true)) {
    on<UserThemeEvent>((event, emit) {
      emit(ThemeState(event.isDarkTheme, false));
    });

    on<SystemThemeEvent>((event, emit) {
      emit(ThemeState(state.isDarkTheme, event.isSystemTheme));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}

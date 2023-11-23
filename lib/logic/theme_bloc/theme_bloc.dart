import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/theme_bloc/theme_event.dart';
import 'package:habit_tracker_app/logic/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.isDarkMode == false) {
        emit(state.copyWith(isDarkMode: true));
      } else {
        emit(state.copyWith(isDarkMode: false));
      }
    });
  }
}

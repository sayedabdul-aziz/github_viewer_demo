import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/services/local_storage.dart';
import 'package:github_viewer_demo/core/themes/bloc/theme_event.dart';
import 'package:github_viewer_demo/core/themes/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDarkTheme: true)) {
    on<ChangeTheme>(
      (event, emit) {
        if (state.isDarkTheme) {
          AppLocal.cacheData('IS_DARK', false);
          emit(state.copyWith(isDarkTheme: false));
        } else {
          AppLocal.cacheData('IS_DARK', true);
          emit(state.copyWith(isDarkTheme: true));
        }
      },
    );
  }
}

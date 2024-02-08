import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/services/local_storage.dart';
import 'package:github_viewer_demo/core/strings/strings.dart';
import 'package:github_viewer_demo/core/themes/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitState());

  late bool isDark = AppLocal().getData(AppStrings.IS_DARK_CACHE) ?? false;

  updateTheme(bool themeMode) {
    isDark = themeMode;
    if (themeMode) {
      AppLocal().cacheData(AppStrings.IS_DARK_CACHE, true);
    } else {
      AppLocal().cacheData(AppStrings.IS_DARK_CACHE, false);
    }
    emit(UpdateThemeState());
  }
}

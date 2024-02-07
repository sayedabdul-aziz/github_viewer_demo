import 'package:github_viewer_demo/core/services/local_storage.dart';

class ThemeState {
  final bool isDarkTheme;

  ThemeState({required this.isDarkTheme});

  ThemeState copyWith({bool? isDarkTheme}) {
    return ThemeState(isDarkTheme: isDarkTheme ?? this.isDarkTheme);
  }

  Future<bool> getTheme() {
    return AppLocal.getData('IS_DARK');
  }
}

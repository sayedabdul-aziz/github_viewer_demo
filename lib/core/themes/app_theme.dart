import 'package:flutter/material.dart';
import 'package:github_viewer_demo/core/util/app_colors.dart';
import 'package:github_viewer_demo/core/util/app_text_styles.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  primaryColorDark: AppColors.black,
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: getbodyStyle(color: AppColors.white, fontSize: 20)),
  primaryColor: AppColors.primaryColor,
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.primaryColor),
);

final darkTheme = ThemeData(
  // colors
  scaffoldBackgroundColor: AppColors.black,
  primaryColorDark: AppColors.white,
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: getbodyStyle(color: AppColors.white, fontSize: 20)),
  primaryColor: AppColors.primaryColor,

  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.primaryColor),
);

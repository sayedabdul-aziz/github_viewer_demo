import 'package:flutter/material.dart';
import 'package:github_viewer_demo/core/util/app_colors.dart';
import 'package:github_viewer_demo/core/util/app_text_styles.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  primaryColorDark: AppColors.black,
  primaryColorLight: AppColors.lightPrimaryColor,
  cardColor: AppColors.cardColor,
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: getbodyStyle(color: AppColors.white, fontSize: 20)),
  primaryColor: AppColors.lightPrimaryColor,
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.lightPrimaryColor),
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  primaryColorLight: AppColors.darkPrimaryColor,
  cardColor: AppColors.cardColor.withOpacity(.2),
  primaryColorDark: AppColors.white,
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimaryColor,
      titleTextStyle: getbodyStyle(color: AppColors.black, fontSize: 20)),
  primaryColor: AppColors.darkPrimaryColor,
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.darkPrimaryColor),
);

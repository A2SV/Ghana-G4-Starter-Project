import 'package:flutter/material.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/theme/text_theme.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      textTheme: CustomTextStyles.kDefaultTextTheme(),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppLightThemeColors.kFieldBackgroundColor,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/theme/text_theme.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      textTheme: CustomTextStyles.kDefaultTextTheme(),
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppLightThemeColors.kFieldBackgroundColor,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  // ColorScheme get _lightColorScheme => const ColorScheme.light().copyWith(
  //     primary: AppLightThemeColors.kLightPrimaryColor,
  //     onPrimary: AppLightThemeColors.kLightOnPrimaryColor,
  //     secondary: AppLightThemeColors.kLightSecondaryColor,
  //     onSecondary: AppLightThemeColors.kLightOnSecondaryColor,
  //     tertiary: AppLightThemeColors.kLightTertiaryColor,
  //     onTertiary: AppLightThemeColors.kLightOnTertiaryColor,
  //   );
}

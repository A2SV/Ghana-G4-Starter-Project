import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/fonts.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/theme/text_theme.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      textTheme: CustomTextStyles.kDefaultTextTheme(),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 25.0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: AppLightThemeColors.kDarkTextColor,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
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

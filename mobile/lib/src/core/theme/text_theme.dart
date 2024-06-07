import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/fonts.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';

class CustomTextStyles {
  static TextTheme kDefaultTextTheme() => TextTheme(
        titleSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.nunito,
          color: AppLightThemeColors.kDarkTextColor,
        ),
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.poppins,
          color: AppLightThemeColors.kDarkTextColor,
        ),
        displayMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.poppins,
          color: AppLightThemeColors.kLightTextColor,
        ),
        displaySmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.poppins,
          color: AppLightThemeColors.kVeryLightTextColor,
        ),
        labelLarge: TextStyle(
          fontSize: 23.sp,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.urbanist,
          color: AppLightThemeColors.kDarkTextColor,
        ),
        labelMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.urbanist,
          color: AppLightThemeColors.kLightTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.urbanist,
          color: AppLightThemeColors.kVeryLightTextColor,
        ),
      );
}

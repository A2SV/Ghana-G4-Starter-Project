import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.onTap,
    this.controller,
  });

  final String labelText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: labelText,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppLightThemeColors.kVeryLightTextFieldBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: AppLightThemeColors.kPrimaryLightColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppLightThemeColors.kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

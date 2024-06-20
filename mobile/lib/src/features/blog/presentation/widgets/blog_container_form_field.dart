import 'package:flutter/material.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';

class BlogContentFormField extends StatelessWidget {
  final TextEditingController controller;
  const BlogContentFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      textFormFieldType: TextFormFieldType.multiline,
      hintText: 'Blog content goes here',
      contentPadding: const EdgeInsets.all(15.0),
      maxLines: 17,
      hintStyle: context.textTheme.labelMedium!.copyWith(
        color: AppLightThemeColors.kVeryLightTextColor,
        fontWeight: FontWeight.w300,
      ),
      borderRadiusValue: 12.0,
    );
  }
}
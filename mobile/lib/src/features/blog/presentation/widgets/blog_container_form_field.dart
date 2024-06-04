import 'package:flutter/material.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';

class BlogContentFormField extends StatelessWidget {
  const BlogContentFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
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
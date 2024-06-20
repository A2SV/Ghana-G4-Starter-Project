
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';

class BlogTagFormField extends StatelessWidget {
  final TextEditingController controller;
  const BlogTagFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      textFormFieldType: TextFormFieldType.regular,
      hintText: 'Blog tag',
      contentPadding: EdgeInsets.symmetric(vertical: 2.h),
      hintStyle: context.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w300,
        color: AppLightThemeColors.kVeryLightTextColor,
      ),
      borderRadiusValue: 12.0,
      prefixIcon: Assets.svg.blogTag.path.asSvgImage().horizontalPadding(3.w),
    );
  }
}

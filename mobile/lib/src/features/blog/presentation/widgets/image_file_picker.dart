
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';

class ImageFilePickerWidget extends StatelessWidget {
  const ImageFilePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppLightThemeColors.kFieldBackgroundColor,
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: const [12],
        color: AppLightThemeColors.kPrimaryColor,
        borderPadding: const EdgeInsets.all(15.0),
        radius: const Radius.circular(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.svg.blogCloudUpload.path.asSvgImage(),
            Text(
              "Upload cover image",
              style: context.textTheme.labelMedium!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ).centered(),
      ),
    );
  }
}

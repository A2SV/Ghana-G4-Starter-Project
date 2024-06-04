import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';

class AddBlogScreen extends StatefulWidget {
  static const String routeName = 'add-blog-screen';
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => AddBlogScreenState();
}

class AddBlogScreenState extends State<AddBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Blog'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Container(
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
            ),
            CustomTextFormField(
              textFormFieldType: TextFormFieldType.regular,
              hintText: 'Enter blog headline',
              contentPadding: EdgeInsets.symmetric(vertical: 2.h),
              hintStyle: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w300,
                color: AppLightThemeColors.kVeryLightTextColor,
              ),
              borderRadiusValue: 12.0,
              prefixIcon: Assets.svg.blogHeader.path
                  .asSvgImage()
                  .horizontalPadding(3.w),
            ).verticalPadding(2.h),
            CustomTextFormField(
              textFormFieldType: TextFormFieldType.multiline,
              hintText: 'Blog content goes here',
              contentPadding: const EdgeInsets.all(15.0),
              maxLines: 17,
              hintStyle: context.textTheme.labelMedium!.copyWith(
                color: AppLightThemeColors.kVeryLightTextColor,
                fontWeight: FontWeight.w300,
              ),
              borderRadiusValue: 12.0,
            ),
            Card(
              shape: const BeveledRectangleBorder(),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Assets.svg.blogBold.path.asSvgImage(),
                  Assets.svg.blogItalic.path.asSvgImage(),
                  Assets.svg.blogUnderline.path.asSvgImage(),
                  Assets.svg.blogStrikethrough.path.asSvgImage(),
                  Assets.svg.blogFormatColor.path.asSvgImage(),
                  Assets.svg.blogFillColor.path.asSvgImage(),
                  Assets.svg.blogSubscript.path.asSvgImage(),
                  Assets.svg.blogSuperscript.path.asSvgImage(),
                ],
              ).verticalPadding(2.h),
            ).topPadding(1.h),
            Card(
              shape: const BeveledRectangleBorder(),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Assets.svg.blogAlignLeft.path.asSvgImage(),
                      SizedBox(
                        width: 3.w,
                      ),
                      Assets.svg.blogAlignCenter.path.asSvgImage(),
                      SizedBox(
                        width: 3.w,
                      ),
                      Assets.svg.blogAlignRight.path.asSvgImage(),
                    ],
                  ),
                  Row(
                    children: [
                      Assets.svg.blogBulletList.path.asSvgImage(),
                      SizedBox(
                        width: 3.w,
                      ),
                      Assets.svg.blogBulletNumbered.path.asSvgImage(),
                    ],
                  ),
                  Row(
                    children: [
                      Assets.svg.blogLink.path.asSvgImage(),
                      SizedBox(
                        width: 3.w,
                      ),
                      Assets.svg.blogImage.path.asSvgImage(),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                ],
              ).verticalPadding(2.h),
            ),
            CustomTextFormField(
              textFormFieldType: TextFormFieldType.regular,
              hintText: 'Blog tag',
              contentPadding: EdgeInsets.symmetric(vertical: 2.h),
              hintStyle: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w300,
                color: AppLightThemeColors.kVeryLightTextColor,
              ),
              borderRadiusValue: 12.0,
              prefixIcon:
                  Assets.svg.blogTag.path.asSvgImage().horizontalPadding(3.w),
            ).onlyPadding(1.h, 4.h, 0, 0),
            CustomButton(
              text: 'Upload blog',
              horizontalPadding: 0.0,
              onPressed: () {},
            ),
            SizedBox(
              height: 6.h,
            ),
          ],
        ).horizontalPadding(30.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';

class FontFormattingToolbarWidget extends StatelessWidget {
  const FontFormattingToolbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

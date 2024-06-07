import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';

class AlignmentFormattingToolbarWidget extends StatelessWidget {
  const AlignmentFormattingToolbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
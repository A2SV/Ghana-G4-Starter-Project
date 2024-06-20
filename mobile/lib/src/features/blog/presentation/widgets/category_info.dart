import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';

class CategoryInfo extends StatelessWidget {
  final String title;
  final int updateCount;

  const CategoryInfo(
      {super.key, required this.title, required this.updateCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            "assets/images/cat_image1.jpg",
            width: 30.w,
          ),
        ),
        Positioned(
          left: 3.w,
          top: 1.h,
          child: CircleAvatar(
            radius: 1.9.h,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/controller.jpg"),
          ),
        ),
        Positioned(
          left: 3.w,
          top: 6.5.h,
          child: Text(
            title,
            style: context.textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 3.w,
          top: 8.5.h,
          child: Text(
            "+ $updateCount Updates",
            style: context.textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

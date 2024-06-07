import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../generated/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';

class ProfileInfoCircle extends StatelessWidget {
  const ProfileInfoCircle({super.key, required this.value, required this.text});

  final String value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppLightThemeColors
                .kSmallerContainerBackgroundColor, // Background color
            shape: BoxShape.circle, // Circular shape
            border: Border.all(
              color: Colors.white, // Border color
              width: 4.0, // Border width
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Text(
              value,
              key: const Key('number-of-blogs'),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.poppins,
                color: AppLightThemeColors.kPrimaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          key: const Key('blogs-text'),
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.poppins,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import 'custom_drawer_header.dart';

class MainSideDrawer extends StatelessWidget {
  const MainSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(244, 245, 253, 1),
      width: 85.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDrawerHeader(
            child: Row(
              children: [
                Container(
                  width: 16.w,
                  height: 7.5.h,
                  decoration: BoxDecoration(
                    color: AppLightThemeColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "B",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "binyam@a2sv.org",
                      style: context.textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 12.sp),
                    Text(
                      "Newbie",
                      style: context.textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Menu",
              style: context.textTheme.displayMedium!.copyWith(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Assets.svg.windowsIcon.path.asSvgImage(),
                  title: Text(
                    "Home",
                    style: context.textTheme.displaySmall!.copyWith(
                      color: AppLightThemeColors.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Assets.svg.myBlog.path.asSvgImage(),
                  title: Text(
                    "My blogs",
                    style: context.textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Assets.svg.profileUser.path.asSvgImage(),
                  title: Text(
                    "Profile",
                    style: context.textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Others",
              style: context.textTheme.displayMedium!.copyWith(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Assets.svg.askQuestion.path.asSvgImage(),
                  title: Text(
                    "About us",
                    style: context.textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Assets.svg.profilePlus.path.asSvgImage(),
                  title: Text(
                    "Get involved",
                    style: context.textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                "Logout",
                style: context.textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

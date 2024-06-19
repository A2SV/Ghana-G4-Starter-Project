import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/main_drawer.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../../core/widgets/blog_card.dart';
import '../../../../core/widgets/custom_textformfield.dart';
import '../widgets/category_info.dart';
import '../widgets/main_drawer.dart';

class BlogsDashboard extends StatefulWidget {
  const BlogsDashboard({super.key});

  static const routeName = "blogs-dashboard";

  @override
  State<BlogsDashboard> createState() => _BlogsDashboardState();
}

class _BlogsDashboardState extends State<BlogsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 1.5.w),
        ],
      ),
      drawer: const MainSideDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.5.w),
              child: RichText(
                text: TextSpan(
                  text: 'Welcome back, ',
                  style: context.textTheme.displayMedium!.copyWith(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Binyam',
                      style: context.textTheme.displayMedium!.copyWith(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.5.w),
              child: Text(
                "We've got some interesting reads for you",
                style: context.textTheme.displaySmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.only(left: 5.5.w),
              child: SizedBox(
                height: 14.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const CategoryInfo(),
                    SizedBox(width: 5.w),
                    const CategoryInfo(),
                    SizedBox(width: 5.w),
                    const CategoryInfo(),
                    SizedBox(width: 5.w),
                    const CategoryInfo(),
                    SizedBox(width: 5.w),
                    const CategoryInfo(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            CustomTextFormField(
              borderRadiusValue: 30.0,
              contentPadding: EdgeInsets.symmetric(vertical: 2.h),
              textFormFieldType: TextFormFieldType.regular,
              hintText: 'Search for blogs',
              hintStyle: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Assets.svg.blogSearch.path
                  .asSvgImage()
                  .horizontalPadding(5.w),
            ).horizontalPadding(20.0),
            SizedBox(height: 2.h),
            for (int i = 0; i < 10; i++)
              const BlogCard(
                tag: "Education",
                email: "kudusbanna@a2sv.org",
                topic: "STUDENTS SHOULD FOCUS MORE ON READING",
                date: "12/12/2024",
              ).onlyPadding(0, 10.0, 20.0, 20.0),
            SizedBox(height: 3.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppLightThemeColors.kPrimaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

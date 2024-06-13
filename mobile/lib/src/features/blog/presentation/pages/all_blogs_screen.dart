import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/widgets.dart';

class AllBlogsScreen extends StatefulWidget {
  static const String routeName = 'all-blogs-screen';
  const AllBlogsScreen({super.key});

  @override
  State<AllBlogsScreen> createState() => _AllBlogsScreenState();
}

class _AllBlogsScreenState extends State<AllBlogsScreen> {
  late final TextEditingController _searchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Blogs',
          style: context.textTheme.displayMedium!.copyWith(
            color: AppLightThemeColors.kDarkTextColor,
            fontSize: 18.sp,
          ),
        ),
        toolbarHeight: 4.h,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.h),
          child: CustomTextFormField(
            borderRadiusValue: 30.0,
            contentPadding: EdgeInsets.symmetric(vertical: 2.h),
            textFormFieldType: TextFormFieldType.regular,
            hintText: 'Search for blogs',
            controller: _searchController,
            hintStyle: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
            prefixIcon:
                Assets.svg.blogSearch.path.asSvgImage().horizontalPadding(5.w),
          ).horizontalPadding(20.0),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const BlogCard().onlyPadding(0, 10.0, 20.0, 20.0);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }
}

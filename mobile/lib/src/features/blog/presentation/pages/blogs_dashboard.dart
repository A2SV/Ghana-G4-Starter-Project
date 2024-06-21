import 'dart:math';

import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/constants/constants.dart';
import 'package:starter_project/src/core/routes/routes.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/features/auth/authentication.dart';
import 'package:starter_project/src/features/blog/data/repositories/tag_repository_impl.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog.dart';
import 'package:starter_project/src/features/blog/presentation/pages/add_blog_screen.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/main_drawer.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../../core/widgets/blog_card.dart';
import '../../../../core/widgets/custom_textformfield.dart';
import '../../data/repositories/blog_repository_impl.dart';
import '../../domain/entities/tags.dart';
import '../widgets/category_info.dart';
import 'all_blogs_screen.dart';

class BlogsDashboard extends StatefulWidget {
  const BlogsDashboard({super.key});

  static const routeName = "blogs-dashboard";

  @override
  State<BlogsDashboard> createState() => _BlogsDashboardState();
}

class _BlogsDashboardState extends State<BlogsDashboard> {
  int _generateRandomNumber() {
    int min = 10;
    int max = 300;
    return min + Random().nextInt(max - min + 1);
  }

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
            SizedBox(
                height: 14.h,
                child: FutureBuilder(
                  future: TagRepositoryImpl().viewAllTags(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      Either<String, List<Tag>>? result = snapshot.data;
                      List<Tag> tags = [];
                      result!.fold(
                        (error) => error,
                        (res) => tags = res,
                      );

                      int blogCount = tags.length;

                      return ListView.builder(
                        itemCount: blogCount,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Row(
                              children: [
                                SizedBox(width: 5.w),
                                CategoryInfo(
                                  title: tags[index].label!,
                                  updateCount: _generateRandomNumber(),
                                ),
                                SizedBox(width: 5.w),
                              ],
                            );
                          }
                          return Row(
                            children: [
                              CategoryInfo(
                                title: tags[index].label!,
                                updateCount: _generateRandomNumber(),
                              ),
                              SizedBox(width: 5.w),
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Something went Wrong",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      );
                    }
                  },
                )),
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
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Blogs",
                    style: context.textTheme.displayMedium!.copyWith(
                      fontSize: 19.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppLightThemeColors.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                    ),
                  ).onPressed(
                    onTap: () {
                      switchScreen(
                          context: context,
                          routeName: AllBlogsScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            FutureBuilder<Either<String, List<Blog>>>(
              future: BlogRepositoryImpl()
                  .viewAllBlogs(), // Change the ID as needed
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.black),
                  ));
                } else if (snapshot.hasData) {
                  print('loading..');
                  Either<String, List<Blog>>? result = snapshot.data;
                  List<Blog> blogs = [];
                  result!.fold((error) => error, (res) => blogs = res);


                  int blogCount = blogs.length;

                  return Column(
                    children: [
                      for (int i = 0; i < blogCount; i++)
                        BlogCard(
                          topic: blogs[i].title,
                          email: blogs[i].userAccount!.email,
                          tag: tagWidget(blogs[i].tags!, context),
                          date: blogs[i].createdDateTime,
                          id: blogs[i].id,
                        ).onlyPadding(0, 10.0, 20.0, 20.0),
                    ],
                  );
                } else {
                  return Center(child: Text('No data found'));
                }
              },
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppLightThemeColors.kPrimaryColor,
        onPressed: () {
          switchScreen(
            context: context,
            routeName: AddBlogScreen.routeName,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

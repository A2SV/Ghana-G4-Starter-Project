import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/cubits/app_user/app_user_cubit.dart';
import 'package:starter_project/src/core/dp_injection/dp_injection.dart';
import 'package:starter_project/src/core/routes/routes.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/utils/custom_snackbar.dart';
import 'package:starter_project/src/features/auth/authentication.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/bloc.dart';
import 'package:starter_project/src/features/blog/presentation/pages/add_blog_screen.dart';
import 'package:starter_project/src/features/blog/presentation/pages/blogs_dashboard/recent_blogs_section.dart';
import 'package:starter_project/src/features/blog/presentation/pages/blogs_dashboard/tags_section.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/main_drawer.dart';

import '../../../../../../generated/assets.gen.dart';
import '../../../../../core/theme/app_light_theme_colors.dart';
import '../../../../../core/widgets/custom_textformfield.dart';
import '../all_blogs_screen.dart';

class BlogsDashboard extends StatefulWidget {
  static const routeName = "blogs-dashboard";
  const BlogsDashboard({super.key});

  @override
  State<BlogsDashboard> createState() => _BlogsDashboardState();
}

class _BlogsDashboardState extends State<BlogsDashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthSuccess) {
        CustomSnackBar.successSnackBar(
          context: context,
          message: '${state.user.firstName} has logged in',
        );
      }
    }, builder: (context, state) {
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
        body: (state is AuthSuccess)
            ? SingleChildScrollView(
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
                              text: (context.read<AppUserCubit>().state
                                      as AppUserLoggedIn)
                                  .user
                                  .firstName,
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
                      child: BlocProvider(
                        create: (_) => dpLocator<TagBloc>(),
                        child: const TagsSection(),
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
                              BlocProvider.of<BlogBloc>(context).add(
                                ViewAllBlogsEvent(),
                              );
                              switchScreen(
                                  context: context,
                                  routeName: AllBlogsScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h),
                    const RecentBlogs(),
                    SizedBox(height: 3.h),
                  ],
                ),
              )
            : (state is AuthLoading)
                ? const Center(child: CircularProgressIndicator())
                : Container(),
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
    });
  }

  @override
  void initState() {
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    // context.read<BlogBloc>().add(ViewAllBlogsEvent());
    super.initState();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/routes/routes.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/features/auth/presentation/pages/profile_screen.dart';
import 'package:starter_project/src/features/profiles/presentation/pages/profile_screen.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../auth/authentication.dart';
import 'custom_drawer_header.dart';

class MainSideDrawer extends StatefulWidget {
  const MainSideDrawer({super.key});

  @override
  State<MainSideDrawer> createState() => _MainSideDrawerState();
}

class _MainSideDrawerState extends State<MainSideDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          switchScreen(
            context: context,
            routeName: LoginScreen.routeName,
            popAndPush: true,
          );
        }
      },
      builder: (context, state) {
        UserAccount? user;
        if (state is AuthSuccess) {
          user = (context.read<AuthBloc>().state as AuthSuccess).user;
        }
        return (state is AuthSuccess)
            ? Drawer(
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
                                (context.read<AuthBloc>().state as AuthSuccess)
                                    .user
                                    .firstName![0],
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
                                (context.read<AuthBloc>().state as AuthSuccess)
                                    .user
                                    .email,
                                style:
                                    context.textTheme.displayMedium!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 12.sp),
                              Text(
                                '${user!.firstName!} ${user.lastName!}',
                                style:
                                    context.textTheme.displayMedium!.copyWith(
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
                            onTap: () {
                              popScreen(context);
                            },
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
                            onTap: () {
                              switchScreen(
                                context: context,
                                routeName: ProfileScreen.routeName,
                              );
                            },
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
                        ).onPressed(
                          onTap: () =>
                              context.read<AuthBloc>().add(AuthLogOut()),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  void initState() {
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    super.initState();
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../../generated/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../auth/presentation/widgets/profile_info_circle.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile-screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary, // Body
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: AppLightThemeColors.kContainerBackgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // Categories Section

                // Main Body Section
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              'Biniyam Odu',
                              key: const Key('user-name'),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.nunito,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'biniyam@a2sv.org',
                                  key: const Key('user-email'),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.poppins,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.verified_outlined,
                                  color: Colors.green,
                                  size: 17,
                                )
                              ],
                            )),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppLightThemeColors
                                        .kVeryLightTextFieldBorder,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 25,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Edit Profile",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_drop_down_outlined),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.03,
                                    ),
                                    child: const Icon(
                                      key: Key('instagram-icon'),
                                      FontAwesomeIcons.instagram,
                                      size: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.03,
                                    ),
                                    child: const Icon(
                                      key: Key('x-icon'),
                                      FontAwesomeIcons.x,
                                      size: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.03,
                                    ),
                                    child: const Icon(
                                      key: Key('facebook-icon'),
                                      FontAwesomeIcons.facebook,
                                      size: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.03,
                                    ),
                                    child: const Icon(
                                      key: Key('threads-icon'),
                                      FontAwesomeIcons.threads,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: AppLightThemeColors.kDarkTextColor,
                              thickness: 0.2,
                              indent: 10.w, // Left indent
                              endIndent: 10.w, // Right indent
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0,
                                  MediaQuery.of(context).size.width * 0.06,
                                  0,
                                  MediaQuery.of(context).size.width * 0.06),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ProfileInfoCircle(
                                    value: "26",
                                    text: "Blogs",
                                  ),
                                  ProfileInfoCircle(
                                    value: "14K",
                                    text: "Followers",
                                  ),
                                  ProfileInfoCircle(
                                    value: "2K",
                                    text: "Following",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12.5.h,
            child: CircleAvatar(
              backgroundColor: AppLightThemeColors.kProfileBackgroundColor,
              radius: 7.h,
              child: Assets.images.superman.path
                  .asAssetImage(width: 23.h)
                  .circularClip(7.5.h),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('floating-button'),
        backgroundColor: AppLightThemeColors.kPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.share,
          size: 4.h,
        ),
      ),
    );
  }
}

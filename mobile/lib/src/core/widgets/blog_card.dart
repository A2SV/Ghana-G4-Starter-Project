import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog_b.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  const BlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/blog-details-screen/${blog.id}');
        // context.go('/blog-details-screen/${id}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppLightThemeColors.kPrimaryColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Assets.images.blogPlaceholder.path
                        .asAssetImage(height: 20.h)
                        .rightPadding(10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: AppLightThemeColors
                            .kOnSecondaryBackgroundLightColor,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text(
                        '5 min read',
                        maxLines: 1,
                        style: context.textTheme.displayMedium!.copyWith(
                          color: AppLightThemeColors.kDarkTextColor,
                          fontSize: 13.sp,
                        ),
                      ).allPadding(5.0),
                    ).symmetricPadding(4.w, 2.h),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 11.h,
                        width: 40.w,
                        child: Text(
                          blog.title,
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: AppLightThemeColors.kTertiaryTextColor,
                          ),
                        ),
                      ),
                      Wrap(
                        children: blog.tags
                                ?.map((tag) => Container(
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: AppLightThemeColors
                                            .kSecondaryBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                      ),
                                      child: Text(
                                        tag.label,
                                        maxLines: 1,
                                        style: context.textTheme.displayLarge!
                                            .copyWith(
                                          fontSize: 13.sp,
                                          color: AppLightThemeColors
                                              .kOnSecondaryBackgroundLightColor,
                                        ),
                                      ).symmetricPadding(10.0, 5.0),
                                    ).verticalPadding(10.0))
                                .toList() ??
                            [],
                      ),
                      Text(
                        blog.userAccount!.email,
                        maxLines: 1,
                        style: context.textTheme.displaySmall!.copyWith(
                          color: AppLightThemeColors.kDarkTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              DateFormat.yMMMd().format(
                DateFormat('yyyy-MM-dd').parse(
                  blog.createdDateTime.toString(),
                ),
              ),
              style: context.textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),
            ).allPadding(10.0),
          ],
        ),
      ),
    );
  }
}

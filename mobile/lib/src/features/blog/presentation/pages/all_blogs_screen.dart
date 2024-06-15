import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/widgets.dart';

import '../../data/repositories/blog_repository_impl.dart';
import '../../domain/domain.dart';
import '../../domain/entities/tags.dart';
import '../../domain/entities/user_account.dart';

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
            contentPadding: EdgeInsets.symmetric( vertical: 2.h),
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
      body:FutureBuilder<Either<String,List<Blog>>>(
        future: BlogRepositoryImpl().viewAllBlogs(), // Change the ID as needed
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('connecting...'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            print('loading..');
            Either<String,List<Blog>>? result=snapshot.data;
            List<Blog> blogs=[Blog(0, 'none', '', '', UserAccount(0,'','','',''), [])];
            result!.fold(
                    (error)=>error,
                    (res)=>blogs=res
            );
            print(blogs[1].tags);
            return Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: blogs.length,
                    itemBuilder: (context,index) {
                      return GestureDetector(
                        child:BlogCard(topic: blogs[index].title,email: blogs[index].userAccount!.email,tag:tagWidget(blogs[index].tags!, context),date: blogs[index].createdDateTime,).onlyPadding(0, 10.0, 20.0, 20.0)
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
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

List<Widget> tagWidget(List<Tag> tags,BuildContext context){
  List<Widget> output=[];

  for (Tag tag in tags){
    print('new tag');
    output.add(
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppLightThemeColors.kSecondaryBackgroundColor,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            tag.label!,
            maxLines: 1,
            style: context.textTheme.displayLarge!.copyWith(
              fontSize: 13.sp,
              color: AppLightThemeColors
                  .kOnSecondaryBackgroundLightColor,
            ),
          ).symmetricPadding(10.0, 5.0),
        ).verticalPadding(10.0)
    );
  }
  print('tagWidget:${tags}');
  return output;
}
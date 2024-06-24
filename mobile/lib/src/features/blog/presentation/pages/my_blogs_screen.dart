import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/utils/custom_snackbar.dart';
import 'package:starter_project/src/core/widgets/widgets.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/bloc.dart';

class MyBlogsScreen extends StatefulWidget {
  static const String routeName = 'my-blogs-screen';
  const MyBlogsScreen({super.key});

  @override
  State<MyBlogsScreen> createState() => _MyBlogsScreenState();
}

class _MyBlogsScreenState extends State<MyBlogsScreen> {
  late final TextEditingController _searchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.1),
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
          ).onlyPadding(0, 10, 20, 20),
        ),
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogDeleted) {
            BlocProvider.of<BlogBloc>(context).add(ViewMyBlogsEvent());
          }
          if (state is BlogFailure) {
            CustomSnackBar.errorSnackBar(
              context: context,
              message: state.message,
            );
          }
         
        },
        builder: (context, state) {
          print(state.toString());
          return 
          (state is ViewBlogs)
              ? (state.blogs.isEmpty)
                  ? Center(
                      child: Text(
                        'No Blogs Available',
                        style: context.textTheme.bodySmall,
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.blogs.length,
                            itemBuilder: (context, index) {
                              return BlogCard(blog: state.blogs[index])
                                  .onlyPadding(0, 10.0, 20.0, 20.0);
                            },
                          ),
                        ),
                      ],
                    )
              : (state is BlogLoading)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container();
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
    context.read<BlogBloc>().add(ViewMyBlogsEvent());
    super.initState();
  }
}

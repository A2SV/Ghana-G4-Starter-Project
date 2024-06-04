import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/widgets.dart';

class AddBlogScreen extends StatefulWidget {
  static const String routeName = 'add-blog-screen';
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => AddBlogScreenState();
}

class AddBlogScreenState extends State<AddBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Blog'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            const ImageFilePickerWidget(),
            const BlogHeaderFormField().verticalPadding(2.h),
            const BlogContentFormField(),
            const FontFormattingToolbarWidget().topPadding(1.h),
            const AlignmentFormattingToolbarWidget(),
            const BlogTagFormField().onlyPadding(1.h, 4.h, 0, 0),
            CustomButton(
              text: 'Upload blog',
              horizontalPadding: 0.0,
              onPressed: () {},
            ),
            SizedBox(
              height: 6.h,
            ),
          ],
        ).horizontalPadding(30.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/widgets.dart';

class EditBlogScreen extends StatefulWidget {
  static const String routeName = 'edit-blog-screen';
  const EditBlogScreen({super.key});

  @override
  State<EditBlogScreen> createState() => EditBlogScreenState();
}

class EditBlogScreenState extends State<EditBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Blog'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const ImageFilePickerWidget(),
                FloatingActionButton(
                  onPressed: () {},
                  child: Assets.svg.blogEdit.path.asSvgImage(),
                ).allPadding(20.0)
              ],
            ),
            const BlogHeaderFormField().verticalPadding(2.h),
            const BlogContentFormField(),
            const FontFormattingToolbarWidget().topPadding(1.h),
            const AlignmentFormattingToolbarWidget(),
            const BlogTagFormField().onlyPadding(1.h, 4.h, 0, 0),
            CustomButton(
              text: 'Save changes',
              horizontalPadding: 0.0,
              onPressed: () {},
            ),
            SizedBox(
              height: 2.h,
            ),
            const DeleteButton(),
            SizedBox(
              height: 6.h,
            ),
          ],
        ).horizontalPadding(30.0),
      ),
    );
  }
}

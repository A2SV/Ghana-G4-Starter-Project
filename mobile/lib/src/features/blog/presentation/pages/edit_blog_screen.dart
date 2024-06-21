import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/validator/validator.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/bloc.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/widgets.dart';

class EditBlogScreen extends StatefulWidget {
  static const String routeName = 'edit-blog-screen';
  final Blog blog;
  const EditBlogScreen({super.key, required this.blog});

  @override
  State<EditBlogScreen> createState() => EditBlogScreenState();
}

class EditBlogScreenState extends State<EditBlogScreen> {
  late TextEditingController _blogHeaderController;
  late TextEditingController _blogContentController;
  late TextEditingController _blogTagController;
  final _editBlogformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        title: const Text('Edit Blog'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<BlogBloc, BlogState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Form(
              key: _editBlogformKey,
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
                  BlogHeaderFormField(controller: _blogHeaderController)
                      .verticalPadding(2.h),
                  BlogContentFormField(controller: _blogContentController),
                  const FontFormattingToolbarWidget().topPadding(1.h),
                  const AlignmentFormattingToolbarWidget(),
                  BlogTagFormField(controller: _blogTagController)
                      .onlyPadding(1.h, 4.h, 0, 0),
                  CustomButton(
                    text: 'Save changes',
                    horizontalPadding: 0.0,
                    onPressed: () {
                      final isValid =
                          CustomValidator.validateForm(_editBlogformKey);
                      if (isValid) {
                        BlocProvider.of<BlogBloc>(context).add(
                          UpdateBlogEvent(
                            title: _blogHeaderController.text,
                            body: _blogContentController.text,
                            tags: _blogTagController.text
                                .split(' ')
                                .mapIndexed((tag, index) => TagModel(
                                    id: index, label: tag, description: tag))
                                .toList(),
                            id: widget.blog.id ?? 0,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomButton(
                    text: 'Delete Blog',
                    horizontalPadding: 0.0,
                    gradient: false,
                    onPressed: () {},
                    textStyle: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                      color: context.colorScheme.error,
                      fontWeight: FontWeight.bold,
                      // fontFamily: FontFamily.urbanist,
                    ),
                    borderColor: context.colorScheme.error,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ).horizontalPadding(30.0),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _blogHeaderController.dispose();
    _blogContentController.dispose();
    _blogTagController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _blogHeaderController = TextEditingController(text: widget.blog.title);
    _blogContentController = TextEditingController(text: widget.blog.body);
    _blogTagController = TextEditingController(
        text: widget.blog.tags!.map((tag) => tag.label).join(' '));
    super.initState();
  }
}

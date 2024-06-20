import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/validator/validator.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/bloc.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/widgets.dart';

class AddBlogScreen extends StatefulWidget {
  static const String routeName = 'add-blog-screen';
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => AddBlogScreenState();
}

class AddBlogScreenState extends State<AddBlogScreen> {
  late TextEditingController _blogHeaderController;
  late TextEditingController _blogContentController;
  late TextEditingController _blogTagController;
  final _addBlogformKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        title: const Text('Add Blog'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addBlogformKey,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              const ImageFilePickerWidget(),
              BlogHeaderFormField(controller: _blogHeaderController)
                  .verticalPadding(2.h),
              BlogContentFormField(controller: _blogContentController),
              const FontFormattingToolbarWidget().topPadding(1.h),
              const AlignmentFormattingToolbarWidget(),
              BlogTagFormField(controller: _blogTagController)
                  .onlyPadding(1.h, 4.h, 0, 0),
              CustomButton(
                text: 'Add blog',
                horizontalPadding: 0.0,
                onPressed: () {
                  final isValid = CustomValidator.validateForm(_addBlogformKey);
                  if (isValid) {
                    BlocProvider.of<BlogBloc>(context).add(
                      CreateBlogEvent(
                        title: _blogHeaderController.text,
                        body: _blogContentController.text,
                        tags: _blogTagController.text
                            .split(' ')
                            .mapIndexed((tag, index) => TagModel(
                                id: index, label: tag, description: tag))
                            .toList(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 6.h,
              ),
            ],
          ).horizontalPadding(30.0),
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
    _blogHeaderController = TextEditingController();
    _blogContentController = TextEditingController();
    _blogTagController = TextEditingController();
    super.initState();
  }
}

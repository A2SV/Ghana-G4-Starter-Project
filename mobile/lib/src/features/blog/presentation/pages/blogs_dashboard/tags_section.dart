import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/utils/custom_snackbar.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/tag/tag_bloc.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/category_info.dart';

class TagsSection extends StatefulWidget {
  const TagsSection({super.key});

  @override
  State<TagsSection> createState() => _TagsSectionState();
}

class _TagsSectionState extends State<TagsSection> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TagBloc, TagState>(
      builder: (context, state) => (state is TagInitial)
          ? Center(
              child: Text(
                'Fetching tags',
                style: context.textTheme.bodySmall!.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                ),
              ),
            )
          : (state is TagSuccess)
              ? (state.tags.isEmpty)
                  ? Center(
                      child: Text(
                        'No tags found',
                        style: context.textTheme.bodySmall!.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.tags.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Row(
                            children: [
                              SizedBox(width: 5.w),
                              CategoryInfo(
                                title: state.tags[index].label,
                                updateCount: _generateRandomNumber(),
                              ),
                              SizedBox(width: 5.w),
                            ],
                          );
                        }
                        return Row(
                          children: [
                            CategoryInfo(
                              title: state.tags[index].label,
                              updateCount: _generateRandomNumber(),
                            ),
                            SizedBox(width: 5.w),
                          ],
                        );
                      },
                    )
              : Center(
                  child: Text(
                    'Something went wrong',
                    style: context.textTheme.bodySmall!
                        .copyWith(color: Colors.red),
                  ),
                ),
      listener: (context, state) {
        if (state is TagInitial) {
          const Text(
            'initial',
            style: TextStyle(
              color: Colors.red,
            ),
          );
        }
        if (state is TagLoading) {
          CustomSnackBar.warningSnackBar(
              context: context, message: 'Fetching tags');
        } else if (state is TagSuccess) {
          CustomSnackBar.warningSnackBar(
              context: context, message: 'Tags fetched');
        }
      },
    );
  }

  @override
  void initState() {
    context.read<TagBloc>().add(const ViewTagsEvent());
    super.initState();
  }

  int _generateRandomNumber() {
    int min = 10;
    int max = 300;
    return min + Random().nextInt(max - min + 1);
  }
}

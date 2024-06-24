import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/widgets.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/bloc.dart';

class RecentBlogs extends StatefulWidget {
  const RecentBlogs({super.key});

  @override
  State<RecentBlogs> createState() => _RecentBlogsState();
}

class _RecentBlogsState extends State<RecentBlogs> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(builder: (context, state) {
      return (state is BlogSuccess)
          ? (state.blogs.isEmpty)
              ? Center(
                  child: Text(
                    'No tags found',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                )
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.blogs.length%4,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogCard(blog: state.blogs[index])
                        .onlyPadding(0, 10.0, 20.0, 20.0);
                  },
                )
          : (state is BlogLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text(
                    'Failed to load blogs',
                    style: context.textTheme.bodySmall!,
                  ),
                );
    }
        // return const Center(child: Text('No data found'));
        );
  }

  @override
  void initState() {
    context.read<BlogBloc>().add(ViewAllBlogsEvent());
    super.initState();
  }
}

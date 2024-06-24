import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/src/core/routes/routes_config.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/utils/custom_snackbar.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/bloc.dart';
import 'package:starter_project/src/features/blog/presentation/pages/edit_blog_screen.dart';

class BlogDetails extends StatefulWidget {
  static const String routeName = 'blog-details-screen';
  final int id;

  const BlogDetails({super.key, required this.id});

  @override
  BlogDetailsState createState() => BlogDetailsState();
}

class BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogDeleted) {
            CustomSnackBar.errorSnackBar(
              context: context,
              message: 'Blog has been deleted',
            );
            popScreen(context);
          }
          if (state is BlogDeleteFailure) {
            context.read<BlogBloc>().add(
                  ViewBlogEvent(id: widget.id),
                );
          }
        },
        builder: (context, state) {
          return (state is BlogLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is ViewBlog)
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: state.blog.tags!
                                      .map(
                                        (tag) => Container(
                                          margin: const EdgeInsets.all(2),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black54,
                                              foregroundColor: Colors.white,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 6),
                                              minimumSize: const Size(0, 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              tag.label,
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                const Text(
                                  '50 minutes ago',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              state.blog.title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              state.blog.userAccount!.email,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 17, 12, 12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Image.asset(
                            'assets/images/pic1.png',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 23),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                            child: Text(
                              state.blog.body,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    )
                  : (state is BlogFailure)
                      ? GestureDetector(
                          onTap: () async {
                            context.read<BlogBloc>().add(
                                  ViewBlogEvent(id: widget.id),
                                );
                          },
                          child: Center(
                            child: Text(
                              state.message,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.error,
                              ),
                            ),
                          ),
                        )
                      : Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switchScreen(
            context: context,
            routeName: EditBlogScreen.routeName,
            extra: (context.read<BlogBloc>().state as ViewBlog).blog,
          );
        },
        backgroundColor: const Color(0xFF436CC9),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<BlogBloc>().add(
          ViewBlogEvent(id: widget.id),
        );
    super.initState();
  }
}

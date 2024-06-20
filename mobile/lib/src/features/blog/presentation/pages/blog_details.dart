import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:starter_project/src/core/routes/routes_config.dart';
import 'package:starter_project/src/features/blog/data/repositories/blog_repository_impl.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog.dart';
import 'package:starter_project/src/features/blog/domain/entities/tags.dart';
import 'package:starter_project/src/features/blog/domain/entities/user_account.dart';
import 'package:starter_project/src/features/blog/presentation/pages/edit_blog_screen.dart';

List<Widget> tagListWidget(Blog blog) {
  List<Widget> output = [];
  print('tags: ${blog.tags}');
  for (Tag tag in blog.tags!) {
    print('tag: ${tag.label}');
    output.add(Container(
      margin: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
              horizontal: 14, vertical: 6), // Adjust padding
          minimumSize: const Size(0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Adjust border radius
          ),
        ),
        child: Text(
          tag.label!,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    ));
  }

  return output;
}

class BlogDetails extends StatefulWidget {
  static const String routeName = 'blog-details-screen';
  final String id;

  const BlogDetails({super.key, required this.id});

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    print('blog details');

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
      body: FutureBuilder<Either<String, Blog>>(
        future: BlogRepositoryImpl()
            .viewBlog(int.parse(widget.id)), // Change the ID as needed
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            print('loading..');
            Either<String, Blog>? result = snapshot.data;
            Blog blog =
                Blog(0, 'none', '', '', UserAccount(0, '', '', '', ''), []);
            result!.fold((error) => error, (res) => blog = res);
            print(blog.createdDateTime);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: tagListWidget(blog),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      blog.title!,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      blog.userAccount!.email!,
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
                      blog.body!,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await BlogRepositoryImpl().viewBlog(int.parse(widget.id));
          if (res.isRight()) {
            final blog = res.getOrElse(
                () => Blog(0, '', '', '', UserAccount(0, '', '', '', ''), []));
            switchScreen(
                context: context,
                routeName: EditBlogScreen.routeName,
                extra: blog);
          }
        },
        backgroundColor: const Color(0xFF436CC9),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}

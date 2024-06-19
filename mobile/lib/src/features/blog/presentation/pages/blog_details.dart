import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_project/src/features/blog/data/repositories/blog_repository_impl.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:starter_project/src/features/blog/domain/entities/tags.dart';
import 'package:starter_project/src/features/blog/domain/entities/user_account.dart';

import '../../domain/domain.dart';


class BlogDetails extends StatefulWidget {
  static const String routeName = 'blog-details-screen';
  final String id;

  const BlogDetails({Key? key,required String this.id}):super(key:key);


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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            context.go('/all-blogs-screen');

          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body:FutureBuilder<Either<String,Blog>>(
        future: BlogRepositoryImpl().viewBlog(int.parse(widget.id)), // Change the ID as needed
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('connecting...'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            print('loading..');
            Either<String,Blog>? result=snapshot.data;
            Blog blog=Blog(0, 'none', '', '', UserAccount(0,'','','',''), []);
            result!.fold(
                (error)=>error,
                    (res)=>blog=res
            );
            print(blog.createdDateTime);
            return  SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      blog.title!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      blog.userAccount!.email!,
                      style: TextStyle(
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
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
                    child: Text(
                      blog.body!,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          BlogRepositoryImpl().viewBlog(26);
        },
        backgroundColor: const Color(0xFF436CC9),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}

List<Widget> tagListWidget(Blog blog){
    List<Widget> output=[];
    print('tags: ${blog.tags}');
    for (Tag tag in blog.tags!){
      print('tag: ${tag.label}');
      output.add(
        Container(
          margin: EdgeInsets.all(2),
          child:ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black54,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 6), // Adjust padding
              minimumSize: const Size(0, 0),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8), // Adjust border radius
              ),
            ),
            child: Text(
              tag.label!,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        )

      );
    }


    return output;

}
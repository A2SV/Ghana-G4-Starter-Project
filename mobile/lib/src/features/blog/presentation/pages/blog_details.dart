import 'package:flutter/material.dart';

class BlogDetails extends StatelessWidget {
  static const String routeName = 'blog-details-screen';

  const BlogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
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
                    child: const Text(
                      'Education',
                      style: TextStyle(fontSize: 10),
                    ),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'STUDENTS SHOULD WORK ON IMPROVING THEIR WRITING SKILL',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'by admin.user@a2sv.org',
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
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: Text(
                '    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum...',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF436CC9),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}

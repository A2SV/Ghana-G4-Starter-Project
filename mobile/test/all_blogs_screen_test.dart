import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/widgets/widgets.dart';
import 'package:starter_project/src/features/blog/presentation/pages/all_blogs_screen.dart';

void main() {
  late TextEditingController searchController;

  setUp(() {
    searchController = TextEditingController();
  });

  tearDown(() {
    searchController.dispose();
  });

  testWidgets('AllBlogsScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            home: AllBlogsScreen(),
          );
        },
      ),
    );

    expect(find.text('My Blogs'), findsOneWidget);
    expect(find.byType(CustomTextFormField), findsOneWidget);
    expect(find.text('Search for blogs'), findsOneWidget);
    expect(find.byType(BlogCard), findsNWidgets(3));
  });
}

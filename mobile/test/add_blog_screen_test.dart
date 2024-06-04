import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';
import 'package:starter_project/src/features/blog/presentation/pages/add_blog_screen.dart';

void main() {
  testWidgets('AddBlogScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            home: AddBlogScreen(),
          );
        },
      ),
    );
    expect(find.text('Add Blog'), findsOneWidget);
    expect(find.byType(CustomTextFormField), findsNWidgets(3));
    expect(find.byType(CustomButton), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(2));
    expect(find.byType(Row), findsNWidgets(6));
    expect(find.byType(SizedBox), findsNWidgets(47));
  });
}

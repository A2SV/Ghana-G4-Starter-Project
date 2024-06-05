import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/blog/presentation/pages/edit_blog_screen.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/widgets.dart';

void main() {
  testWidgets('EditBlogScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            home: EditBlogScreen(),
          );
        },
      ),
    );

    expect(find.text('Edit Blog'), findsOneWidget);
    expect(find.byType(ImageFilePickerWidget), findsOneWidget);
    expect(find.byType(BlogHeaderFormField), findsOneWidget);
    expect(find.byType(BlogContentFormField), findsOneWidget);
    expect(find.byType(FontFormattingToolbarWidget), findsOneWidget);
    expect(find.byType(AlignmentFormattingToolbarWidget), findsOneWidget);
    expect(find.byType(BlogTagFormField), findsOneWidget);
    expect(find.text('Save changes'), findsOneWidget);
    expect(find.byType(DeleteButton), findsOneWidget);
  });
}

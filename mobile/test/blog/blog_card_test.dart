import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/widgets/blog_card.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            body: child,
          );
        },
      ),
    );
  }

  testWidgets('BlogCard UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: const BlogCard()));

    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Stack), findsNWidgets(2));
    expect(find.byType(SizedBox), findsNWidgets(2));
    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(DecoratedBox), findsNWidgets(3));
    expect(find.byType(Icon), findsNothing);
    expect(find.byType(Image), findsOneWidget);
  });
}

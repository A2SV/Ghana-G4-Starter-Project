import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/font_formatting_toolbar.dart';

void main() {
  testWidgets('FontFormattingToolbarWidget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (buildContext, orientation, screenType) {
          return const MaterialApp(
            home: Scaffold(
              body: FontFormattingToolbarWidget(),
            ),
          );
        },
      ),
    );

    expect(find.byType(SvgPicture), findsNWidgets(8));
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    
  });
}

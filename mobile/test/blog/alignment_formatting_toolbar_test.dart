import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/alignment_formatting_toolbar.dart';

void main() {
  testWidgets('should render AlignmentFormattingToolbarWidget correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            home: Scaffold(
              body: AlignmentFormattingToolbarWidget(),
            ),
          );
        },
      ),
    );

    // Verify if certain widgets are present
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Row), findsNWidgets(4));
    expect(find.byType(SizedBox), findsNWidgets(20));
    expect(find.byType(SvgPicture), findsNWidgets(7));
  });
}

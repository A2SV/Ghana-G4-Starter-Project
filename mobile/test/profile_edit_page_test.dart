import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/profiles/presentation/pages/profile_edit_page.dart';
import 'package:starter_project/src/features/profiles/presentation/widgets/profile_drop_down_field.dart';
import 'package:starter_project/src/features/profiles/presentation/widgets/profile_text_field.dart';

void main() {
  testWidgets('Test for all components', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            home: ProfileEditPage(),
          );
        },
      ),
    );

    // Finding exactly 4 of the custom text inputs
    expect(find.byType(ProfileTextField), findsNWidgets(4));

    // Find exactly 2 of the custom drop down buttons
    expect(find.byType(ProfileDropDownField), findsNWidgets(2));
  });

  testWidgets('Date picker modal shows and hides correctly',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            home: ProfileEditPage(),
          );
        },
      ),
    );

    // Verify that the "Show Date Picker" button is present
    expect(find.byKey(const ValueKey("Date input")), findsOneWidget);

    // Tap the "Show Date Picker" button
    await tester.tap(find.byKey(const ValueKey("Date input")));
    await tester.pumpAndSettle();

    // Verify that the "Date of Birth" text is present in the modal
    expect(find.text("Date of Birth"), findsOneWidget);

    // Verify that the close button is present
    expect(find.byKey(const ValueKey("close icon")), findsOneWidget);

    // Tap the close button
    await tester.tap(find.byKey(const ValueKey("close icon")));
    await tester.pumpAndSettle();

    // Verify that the modal is dismissed
    expect(find.text('Date of Birth'), findsNothing);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/auth/presentation/pages/otp_screen.dart';
import 'package:starter_project/src/features/auth/presentation/pages/profile_screen.dart';
import 'package:starter_project/src/features/auth/presentation/widgets/custom_pinput.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';

void main() {
    testWidgets(
        'Should render profile screen', (WidgetTester tester) async {
      // Build the OtpScreen widget inside a MaterialApp and ResponsiveSizer
      await tester.pumpWidget(
        ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return  MaterialApp(
              home: ProfileScreen(),
            );
          },
        ),
      );

      // Verify if certain widgets are present
      expect(find.byKey(ValueKey('profile-picture')), findsOneWidget);
      expect(find.byKey(ValueKey('user-name')), findsOneWidget);
      expect(find.byKey(ValueKey('user-email')), findsOneWidget);
      expect(find.byKey(ValueKey('instagram-icon')), findsOneWidget);
      expect(find.byKey(ValueKey('facebook-icon')), findsOneWidget);
      expect(find.byKey(ValueKey('x-icon')), findsOneWidget);
      expect(find.byKey(ValueKey('threads-icon')), findsOneWidget);
      expect(find.byKey(ValueKey('number-of-followers')), findsOneWidget);
      expect(find.byKey(ValueKey('number-of-following')), findsOneWidget);
      expect(find.byKey(ValueKey('number-of-blogs')), findsOneWidget);
      expect(find.byKey(ValueKey('floating-button')), findsOneWidget);
    });

}
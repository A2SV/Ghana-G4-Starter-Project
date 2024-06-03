import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/auth/presentation/pages/otp_screen.dart';
import 'package:starter_project/src/features/auth/presentation/widgets/custom_pinput.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';

void main() {
  group('OtpScreen Widget Test', () {
    testWidgets('should render OtpScreen correctly', (WidgetTester tester) async {
      // Build the OtpScreen widget inside a MaterialApp and ResponsiveSizer
      await tester.pumpWidget(
        ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              home: OtpScreen(),
            );
          },
        ),
      );

      // Verify if certain widgets are present
      expect(find.text('Enter OTP'), findsOneWidget);
      expect(find.text('An OTP has been send to user.name@a2sv.org'), findsOneWidget);
      expect(find.byType(CustomPinPutFormField), findsOneWidget);
      expect(find.text('resend code in'), findsOneWidget);
      expect(find.byType(CustomButton), findsOneWidget);
    });

    testWidgets('should update countdown timer', (WidgetTester tester) async {
      await tester.pumpWidget(
        ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              home: OtpScreen(),
            );
          },
        ),
      );

      // Start the timer
      final state = tester.state(find.byType(OtpScreen)) as OtpScreenState;
      state.startTimer();

      // Initial countdown value
      expect(find.text('3:00s'), findsOneWidget);

      // Simulate time passing
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('2:59s'), findsOneWidget);

      await tester.pump(const Duration(seconds: 59));
      expect(find.text('2:00s'), findsOneWidget);

      await tester.pump(const Duration(seconds: 60));
      expect(find.text('1:00s'), findsOneWidget);

      await tester.pump(const Duration(seconds: 60));
      expect(find.text('0:00s'), findsOneWidget);
    });
  });
}

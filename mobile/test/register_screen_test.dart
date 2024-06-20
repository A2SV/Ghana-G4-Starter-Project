import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';
import 'package:starter_project/src/features/auth/presentation/pages/register_screen.dart';

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

  testWidgets('RegisterScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: const RegisterScreen()));

    expect(find.text('Register'), findsNWidgets(2));
    expect(find.byType(CustomTextFormField), findsNWidgets(2));
    expect(find.byType(CustomButton), findsOneWidget);

    final richTextFinder = find.byKey(const Key('registerRichText'));
    expect(richTextFinder, findsOneWidget);

    final RichText richText = tester.widget(richTextFinder);
    final TextSpan textSpan = richText.text as TextSpan;

    expect(textSpan.text, 'Already have an account');
    expect(textSpan.children!.length, 2);
    expect((textSpan.children![0] as TextSpan).text, '?');
    expect((textSpan.children![1] as TextSpan).text, ' Login');
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';

void main() {
  final TextEditingController controller = TextEditingController();

  Widget makeTestableWidget({required Widget child}) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: Scaffold(
            body: child,
          ),
        );
      },
    );
  }

  testWidgets('CustomTextFormField regular type test',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(
      child: CustomTextFormField(
        textFormFieldType: TextFormFieldType.regular,
        hintText: 'Test',
        controller: controller,
      ),
    ));

    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('CustomTextFormField multiline type test',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(
      child: CustomTextFormField(
        textFormFieldType: TextFormFieldType.multiline,
        hintText: 'Test',
        controller: controller,
      ),
    ));

    expect(find.byType(CustomTextFormField), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('CustomTextFormField password type test',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(
      child: CustomTextFormField(
        textFormFieldType: TextFormFieldType.password,
        hintText: 'Test',
        controller: controller,
      ),
    ));

    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);
  });
}

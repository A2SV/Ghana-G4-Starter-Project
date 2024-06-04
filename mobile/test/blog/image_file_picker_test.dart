import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/blog/presentation/widgets/image_file_picker.dart';

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

  testWidgets('ImageFilePickerWidget UI Test', (WidgetTester tester) async {
    await tester
        .pumpWidget(makeTestableWidget(child: const ImageFilePickerWidget()));

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final dottedBorderFinder = find.byType(DottedBorder);
    expect(dottedBorderFinder, findsOneWidget);

    final columnFinder = find.byType(Column);
    expect(columnFinder, findsOneWidget);

    final svgImageFinder = find.byType(SvgPicture);
    expect(svgImageFinder, findsOneWidget);

    final textFinder = find.text('Upload cover image');
    expect(textFinder, findsOneWidget);
  });
}

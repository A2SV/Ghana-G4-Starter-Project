import 'package:flutter/material.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = 'otp-screen';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.svg.amico.path.asSvgImage(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = 'otp-screen';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.svg.amico.path
                .asSvgImage(
                  height: 285,
                  width: 300,
                )
                .centered(),
            const Text(
              'Enter OTP',
              
            ),
            const Text(
              'An OTP has been send to user.name@a2sv.org',
            ),
            CustomButton(
              text: 'Continue',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

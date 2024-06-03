import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/features/auth/presentation/widgets/custom_pinput.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = 'otp-screen';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.svg.amico.path
                .asSvgImage(
                  height: 285,
                  width: 300,
                )
                .centered(),
            Text(
              'Enter OTP',
              style: context.textTheme.labelLarge!.copyWith(
                fontSize: 34.sp,
              ),
            ),
            Text(
              'An OTP has been send to user.name@a2sv.org',
              style: context.textTheme.labelMedium,
            ).rightPadding(100.0),
            CustomPinPutFormField(
              controller: _otpController,
              length: 6,
            ),
            CustomButton(
              horizontalPadding: 0.0,
              text: 'Continue',
              onPressed: () {},
            ),
          ],
        ).horizontalPadding(30.0),
      ),
    );
  }
}

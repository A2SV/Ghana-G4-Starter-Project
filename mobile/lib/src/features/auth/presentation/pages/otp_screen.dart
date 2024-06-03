import 'dart:async';

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
  late Timer _timer;
  int _countDown = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.svg.amico.path
                .asSvgImage(
                  height: 285,
                  width: 300,
                )
                .centered(),
                const SizedBox(
              height: 40.0,
            ),
            Text(
              'Enter OTP',
              style: context.textTheme.labelLarge!.copyWith(
                fontSize: 23.sp,
              ),
            ).align(Alignment.centerLeft),
            Text(
              'An OTP has been send to user.name@a2sv.org',
              style: context.textTheme.labelMedium,
            ).rightPadding(100.0),
            const SizedBox(
              height: 35.0,
            ),
            CustomPinPutFormField(
              controller: _otpController,
              length: 6,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'resend code in',
              style: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ).align(Alignment.centerLeft),
            Text(
              _formatTime(_countDown),
              style: context.textTheme.displayLarge!.copyWith(
                fontSize: 23.sp,
              ),
            ).align(Alignment.centerLeft),
            const SizedBox(
              height: 180.0,
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

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void resetTimer() {
    setState(() {
      _countDown = 180;
    });
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countDown == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _countDown--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}s';
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 100.h,
        child: const Column(
          children: [
            Center(
              child: Text(
                "Test page",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

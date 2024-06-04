import 'package:flutter/material.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding1/on_boarding.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding2/get_started.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding3/login.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return  PageView(
      children: [OnBoardingScreen(),
      GetStarted(),
      LoginScreen()],
    );
  }
}
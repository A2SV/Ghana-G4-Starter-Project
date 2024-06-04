import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding1/on_boarding.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding2/get_started.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding3/login.dart';

import 'src/core/dp_injection/dependency_injection.dart';
import 'src/core/routes/routes_config.dart';
import 'src/features/auth/presentation/bloc/auth/auth_bloc.dart';

// await initializeBackgroundService();
void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => dpLocator<AuthBloc>()),
      ],
      child: MyApp(),
      // MaterialApp(home: const OnBoardingScreen()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.detached) {}
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return AppRouter();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/features/auth/presentation/pages/dashboard.dart';
import 'package:starter_project/src/features/auth/presentation/pages/thank_you.dart';
import 'package:starter_project/src/features/auth/presentation/widgets/folder.dart';

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
      child: const MyApp(),
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
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return AppRouter();
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.detached) {}
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
}

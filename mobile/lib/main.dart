import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/cubits/app_user/app_user_cubit.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/blog/blog_bloc.dart';

import 'src/core/dp_injection/dependency_injection.dart';
import 'src/core/routes/routes_config.dart';
import 'src/features/auth/presentation/bloc/auth/auth_bloc.dart';

// await initializeBackgroundService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => dpLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => dpLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => dpLocator<BlogBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
  // runApp(
  //   MultiBlocProvider(
  //     providers: [
  //       BlocProvider(create: (context) => dpLocator<AuthBloc>()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
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

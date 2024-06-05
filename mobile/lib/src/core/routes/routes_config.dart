import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_project/src/core/routes/routes.dart';
import 'package:starter_project/src/core/theme/theme_config.dart';
import '../error/error.dart';

class AppRouter extends StatelessWidget {
  static final GoRouter router = createRoute();

  static Future<String?> redirect(GoRouterState state) async {
    try {} on CacheException {}
    return null;
  }

  static GoRouter createRoute() {
    return GoRouter(
      redirect: ((context, state) => redirect(state)),
      initialLocation: "/login-screen",
      routes: routes,
      observers: [],
    );
  }



  AppRouter({
    super.key,
  }) {
    (context, state) => const MaterialPage(
          key: ValueKey('errorPage'),
          child: Scaffold(
            body: Center(
              child: Text("Error Page."),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Starter Project mobile',
      theme: ThemeConfig.lightTheme,
      routerConfig: router,
    );
  }
}

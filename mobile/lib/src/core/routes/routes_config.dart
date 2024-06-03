import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_project/src/core/routes/routes.dart';
import '../error/error.dart';
import '../theme/light_theme.dart';

class AppRouter extends StatelessWidget {
  static final GoRouter router = createRoute();

  static Future<String?> redirect(GoRouterState state) async {
    try {} on CacheException {}
    return null;
  }

  static GoRouter createRoute() {
    return GoRouter(
      redirect: ((context, state) => redirect(state)),
      initialLocation: "/test",
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
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Starter Project mobile',
        theme: lightTheme,
        routerConfig: router,
      ),
    );
  }
}

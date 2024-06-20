import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_project/src/core/routes/routes.dart';
import 'package:starter_project/src/core/theme/theme_config.dart';

import '../error/error.dart';

canPopScreen(BuildContext context) {
  return context.canPop();
}

popScreen(BuildContext context, {Object? result}) {
  if (canPopScreen(context)) {
    context.pop(result);
  }
}

switchScreen({
  required BuildContext context,
  required String routeName,
  Map<String, String>? pathParameters,
  Map<String, dynamic>? queryParameters,
  Object? extra,
  bool popAndPush = false,
}) {
  /// Use this when to navigate the user but pop any other screen before
  popAndPush
      ? context.goNamed(
          routeName,
          pathParameters: pathParameters ?? <String, String>{},
          queryParameters: queryParameters ?? <String, dynamic>{},
          extra: extra,
        )
      : context.pushNamed(
          routeName,
          pathParameters: pathParameters ?? <String, String>{},
          queryParameters: queryParameters ?? <String, dynamic>{},
          extra: extra,
        );
}

class AppRouter extends StatelessWidget {
  static final GoRouter router = createRoute();

  static Future<String?> redirect(GoRouterState state) async {
    try {} on CacheException {}
    return null;
  }

  static GoRouter createRoute() {
    return GoRouter(
      redirect: ((context, state) => redirect(state)),
      initialLocation: '/blogs-dashboard',
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

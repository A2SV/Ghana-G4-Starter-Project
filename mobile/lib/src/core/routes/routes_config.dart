import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart' as hive;
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/dp_injection/dp_injection.dart';
import 'package:starter_project/src/core/routes/routes.dart';
import 'package:starter_project/src/core/theme/theme_config.dart';
import 'package:starter_project/src/features/auth/authentication.dart';
import 'package:starter_project/src/features/blog/presentation/pages/blogs_dashboard/blogs_dashboard.dart';

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

  static GoRouter createRoute() {
    final loginReturn =
        dpLocator.call<hive.Box<LoginReturnModel>>().get(Constants.loginReturn);
    return GoRouter(
      redirect: (BuildContext context, GoRouterState state) {
        if (state.matchedLocation == "/" && loginReturn != null) {
          return "/${BlogsDashboard.routeName}";
        }

        return state.matchedLocation;
      },
      initialLocation: "/",
      routes: routes,
      observers: [],
    );
  }

  static Future<String?> redirect(GoRouterState state) async {
    try {} on CacheException {}
    return null;
  }
}

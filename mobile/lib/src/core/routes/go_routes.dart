import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/test_page.dart';
import './app_routes.dart';

//* Splash routes
@TypedGoRoute<SplashRoute>(
  name: AppRoutes.test,
  path: "/test",
)
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TestScreen();
  }
}

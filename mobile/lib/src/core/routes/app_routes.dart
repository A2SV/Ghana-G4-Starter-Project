import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_project/src/features/auth/presentation/pages/otp_screen.dart';
import 'package:starter_project/src/features/auth/presentation/pages/register_screen.dart';
import 'package:starter_project/src/features/blog/presentation/pages/add_blog_screen.dart';
import '../widgets/test_page.dart';

class AppRoutes {
  //* Test route
  static const String test = "test";
  static const String otpScreen = 'otp-screen';
  static const String registerScreen = 'register-screen';
  static const String addblogScreen = 'add-blog-screen';
}

//* Custom transition page
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

//* Default page builder
Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(
        Widget child) =>
    (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
        context: context,
        state: state,
        child: child,
      );
    };

final routes = <GoRoute>[
  //* Test page(for testing purposes)
  GoRoute(
    name: AppRoutes.test,
    path: "/test",
    builder: (context, state) => const TestScreen(),
  ),
  GoRoute(
    name: AppRoutes.otpScreen,
    path: '/${OtpScreen.routeName}',
    builder: (context, state) => const OtpScreen(),
  ),
  GoRoute(
    name: AppRoutes.registerScreen,
    path: '/${RegisterScreen.routeName}',
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    name: AppRoutes.addblogScreen,
    path: '/${AddBlogScreen.routeName}',
    builder: (context, state) => const AddBlogScreen(),
  ),
];

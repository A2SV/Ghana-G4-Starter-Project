import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter_project/src/features/auth/presentation/pages/LoginPage.dart';
import 'package:starter_project/main.dart';


void main() {
  testWidgets('Login Screen Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginScreen(),));



    // Verify that our counter starts at 0.
    final title = find.byKey(ValueKey('login-page-text'));
    final image = find.byKey(ValueKey('login-page-image'));
    final email = find.byKey(ValueKey('email-field'));
    final password = find.byKey(ValueKey('password-field'));
    final button = find.byKey(ValueKey('login-button'));
    final footer = find.byKey(ValueKey('footer-text'));
    final register = find.byKey(ValueKey('register-button'));


    //expect return
    expect(title, findsOneWidget);
    expect(image, findsOneWidget);
    expect(email, findsOneWidget);
    expect(password, findsOneWidget);
    expect(button, findsOneWidget);
    expect(footer, findsOneWidget);
    expect(register, findsOneWidget);

    //execute
    await tester.enterText(email, 'user');
    await tester.enterText(password, 'root');
    await tester.tap(button);
    for (int i = 0; i < 5; i++) {
      await tester.pump(Duration(seconds: 1));
    }
    
  });
}
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/generated/fonts.gen.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.svg.cuate.path.asSvgImage(
              height: 345.0,
              width: 350.0,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'Register',
              style: context.textTheme.labelLarge,
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomTextFormField(
              textFormFieldType: TextFormFieldType.regular,
              hintText: 'Email',
              controller: emailController,
              prefixIcon: Assets.svg.emailPrefixIcon.path
                  .asSvgImage()
                  .onlyPadding(0, 0, 6.w, 3.w),
            ).verticalPadding(0.5.h),
            CustomTextFormField(
              textFormFieldType: TextFormFieldType.password,
              hintText: 'Password',
              controller: passwordController,
              prefixIcon: Assets.svg.passwordPrefixIcon.path
                  .asSvgImage()
                  .onlyPadding(0, 0, 6.w, 3.w),
            ).verticalPadding(0.5.h),
            SizedBox(
              height: 8.h,
            ),
            CustomButton(
              text: 'Register',
              onPressed: () {},
              horizontalPadding: 0.0,
            ),
            SizedBox(
              height: 7.h,
            ),
            RichText(
              key: const Key('registerRichText'),
              text: TextSpan(
                text: 'Already have an account',
                children: [
                  TextSpan(
                    text: '?',
                    style: context.textTheme.labelSmall!.copyWith(
                      fontFamily: FontFamily.pacifico,
                    ),
                  ),
                  TextSpan(
                    text: ' Login',
                    style: context.textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppLightThemeColors.kPrimaryColor,
                    ),
                  ),
                ],
                style: context.textTheme.labelSmall,
              ),
            ),
          ],
        ).horizontalPadding(30.0),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }
}

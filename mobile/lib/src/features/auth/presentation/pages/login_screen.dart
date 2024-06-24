import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/generated/fonts.gen.dart';
import 'package:starter_project/src/core/cubits/app_user/app_user_cubit.dart';
import 'package:starter_project/src/core/routes/routes_config.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/utils/custom_snackbar.dart';
import 'package:starter_project/src/core/validator/validator.dart';
import 'package:starter_project/src/core/widgets/animated_column.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';
import 'package:starter_project/src/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:starter_project/src/features/auth/presentation/pages/register_screen.dart';
import 'package:starter_project/src/features/blog/presentation/pages/blogs_dashboard/blogs_dashboard.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login-screen';
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              CustomSnackBar.errorSnackBar(
                context: context,
                message: state.message,
              );
            } else if (state is AuthSuccess) {
              switchScreen(
                context: context,
                routeName: BlogsDashboard.routeName,
                popAndPush: true,
                extra: state.user,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _loginFormKey,
              child: AnimatedColumnWidget(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Assets.svg.loginCuate.path.asSvgImage(
                    height: 345.0,
                    width: 350.0,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Login',
                    style: context.textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextFormField(
                    validate: (String? email) =>
                        CustomValidator.validateEmail(email!),
                    textFormFieldType: TextFormFieldType.regular,
                    hintText: 'Email',
                    controller: emailController,
                    prefixIcon: Assets.svg.emailPrefixIcon.path
                        .asSvgImage()
                        .onlyPadding(0, 0, 6.w, 3.w),
                  ).verticalPadding(0.5.h),
                  CustomTextFormField(
                    validate: (String? password) =>
                        CustomValidator.validatePassword(password!),
                    textFormFieldType: TextFormFieldType.password,
                    hintText: 'Password',
                    controller: passwordController,
                    prefixIcon: Assets.svg.passwordPrefixIcon.path
                        .asSvgImage()
                        .onlyPadding(0, 0, 6.w, 3.w),
                  ).verticalPadding(0.5.h),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomButton(
                    showSuffixWidget: true,
                    suffixWidget: state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Container(),
                    disabled: state is AuthLoading,
                    text: 'Login',
                    onPressed: () {
                      final isValid =
                          CustomValidator.validateForm(_loginFormKey);
                      if (isValid) {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      }
                    },
                    horizontalPadding: 0.0,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      RichText(
                        key: const Key('loginRichText'),
                        text: TextSpan(
                          text: 'New to ',
                          children: [
                            TextSpan(
                              text: 'A2SV?',
                              style: context.textTheme.labelSmall!.copyWith(
                                fontFamily: FontFamily.pacifico,
                              ),
                            ),
                          ],
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                      Text(
                        ' Register',
                        style: context.textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppLightThemeColors.kPrimaryColor,
                        ),
                      ).onPressed(
                        onTap: () => switchScreen(
                          context: context,
                          routeName: RegisterScreen.routeName,
                          popAndPush: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ).horizontalPadding(30.0),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

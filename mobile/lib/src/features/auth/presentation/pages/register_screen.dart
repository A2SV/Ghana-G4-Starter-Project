import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/generated/assets.gen.dart';
import 'package:starter_project/generated/fonts.gen.dart';
import 'package:starter_project/src/core/routes/routes_config.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/utils/custom_snackbar.dart';
import 'package:starter_project/src/core/validator/validator.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';
import 'package:starter_project/src/core/widgets/custom_textformfield.dart';
import 'package:starter_project/src/features/auth/authentication.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                routeName: LoginScreen.routeName,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _registerFormKey,
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
                    validate: (String? name) =>
                        CustomValidator.validateName(name!),
                    textFormFieldType: TextFormFieldType.regular,
                    hintText: 'Full Name',
                    controller: nameController,
                    prefixIcon: Assets.svg.fullNamePrefixIcon.path
                        .asSvgImage()
                        .onlyPadding(0, 0, 6.w, 3.w),
                  ).verticalPadding(0.5.h),
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
                    horizontalPadding: 0.0,
                    showSuffixWidget: true,
                    suffixWidget: state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Container(),
                    disabled: state is AuthLoading,
                    text: 'Register',
                    onPressed: () {
                      final isValid =
                          CustomValidator.validateForm(_registerFormKey);
                      if (isValid) {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthRegister(
                            email: emailController.text,
                            password: passwordController.text,
                            firstName: nameController.text.split(' ')[0],
                            lastName: nameController.text.split(' ')[1],
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
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
                          ],
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                      Text(
                        ' Login',
                        style: context.textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppLightThemeColors.kPrimaryColor,
                        ),
                      ).onPressed(
                        onTap: () => switchScreen(
                          context: context,
                          routeName: LoginScreen.routeName,
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
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }
}

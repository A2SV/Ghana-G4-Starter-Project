import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/theme/text_theme.dart';
import 'package:starter_project/src/core/validator/validator.dart';
import 'package:starter_project/src/features/auth/presentation/bloc/auth/auth_bloc.dart';

import '../../../../../generated/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';

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
  bool _obscuretext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Form(
            key: _loginFormKey,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Center(
                        child:
                            Image.asset('assets/images/girl_holding_phone.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      alignment: Alignment.centerLeft,
                      child: Text('Log in',
                          style: CustomTextStyles.kDefaultTextTheme()
                              .displayLarge),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.all(20),
                              child: Card(
                                child: Container(
                                  child: TextField(
                                    controller: emailController,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.poppins,
                                      color: Colors.black,
                                    ),
                                    decoration: const InputDecoration(
                                        fillColor: AppLightThemeColors
                                            .kFieldBackgroundColor,
                                        filled: true,
                                        hintText: 'Email',
                                        icon: Icon(
                                          Icons.mail_outline,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Card(
                        child: Container(
                          child: TextField(
                            
                            obscureText: _obscuretext,
                            controller: passwordController,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.poppins,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Password',
                                icon: const Icon(
                                  Icons.lock_outline,
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscuretext
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscuretext = !_obscuretext;
                                      });
                                    }),
                                border: InputBorder.none,
                                fillColor:
                                    AppLightThemeColors.kFieldBackgroundColor,
                                filled: true),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.poppins,
                          color: const Color.fromRGBO(67, 108, 201, 1),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      child: Column(
                        children: <Widget>[
                          Container(
                            // Adjust the border radius as needed,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff374ABE),
                                        Color(0xff64B6FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            child: Row(
                              children: [
                                Text('New to A2SV?',
                                    style: CustomTextStyles.kDefaultTextTheme()
                                        .displayMedium),
                                TextButton(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.poppins,
                                      color:
                                          const Color.fromRGBO(67, 108, 201, 1),
                                    ),
                                  ),
                                  onPressed: () {
                                    final isValid =
                                        CustomValidator.validateForm(
                                            _loginFormKey);
                                    if (isValid) {
                                      // route upon
                                    }
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}


import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/theme/text_theme.dart';

import '../../../../../generated/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';


TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
bool _obscuretext=false;

class LoginScreen extends StatefulWidget{
  static const String routeName = 'login-screen';
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  void initState(){
    _obscuretext=false;

  }
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child:Center(
            child: Container(
              alignment: Alignment.center,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(
                      child: Image.asset('assets/images/girl_holding_phone.png'),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Log in',
                        style: CustomTextStyles.kDefaultTextTheme().displayLarge
                    ),
                  ),

                  Container(
                    child:  Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(20),
                            child:Card(
                              child:Container(

                                child: TextField(
                                      controller: emailController,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: FontFamily.poppins,
                                        color: Colors.black,
                                      ),
                                      decoration:const InputDecoration(
                                        fillColor: AppLightThemeColors.kFieldBackgroundColor,
                                        filled: true,
                                        hintText: 'Email',
                                        icon: Icon(
                                          Icons.mail_outline,
                                        ),
                                        border: InputBorder.none
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(20),
                    child: Card(
                      child: Container(
                        child: TextField(

                          obscureText: _obscuretext,
                          controller: passwordController,
                          style:  TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.poppins,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: 'Password',
                              icon: Icon(
                                  Icons.lock_outline,
                              ),
                          suffixIcon:IconButton(
                              icon: Icon(
                                _obscuretext ? Icons.visibility_outlined : Icons.visibility_off_outlined ,
                              ),
                              onPressed:(){
                                setState(() {
                                  _obscuretext=!_obscuretext;
                                });
                              }

                          ),
                              border: InputBorder.none,
                              fillColor: AppLightThemeColors.kFieldBackgroundColor,
                              filled: true
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.poppins,
                        color: Color.fromRGBO(67, 108, 201, 1),
                      ),
                    ),
                  ),



                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    child:Column(
                      children: <Widget>[

                        Container(
                          // Adjust the border radius as needed,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          child:Row(
                            children: [
                              Text(
                                  'New to A2SV?',
                                  style: CustomTextStyles.kDefaultTextTheme().displayMedium
                              ),
                              TextButton(
                                child: Text(
                                    'Register',
                                    style:TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.poppins,
                                      color: Color.fromRGBO(67, 108, 201, 1),
                                    ),
                                ),
                                onPressed: (){
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
        )
    );
  }
}
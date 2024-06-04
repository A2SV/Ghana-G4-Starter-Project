
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' hide State;


TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  key: Key('login-page-image'),
                  child: Center(
                    child: Image.asset('assets/login_page_image-1.jpg'),
                  ),
                ),
                Container(
                  key: Key('login-page-text'),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),

                Container(
                  key: Key('email-field'),
                  child:  Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(20),
                          child:Card(
                            child:Container(
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: 'Email'
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),

                Container(
                  key: Key('password-field'),
                  child: Card(
                    child: Container(

                      margin: EdgeInsets.all(20),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: 'Password'
                        ),
                      ),
                    ),
                  ),
                ),







                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  child:Column(
                    children: <Widget>[

                      Container(
                        key: Key('login-button'),
                        child: ElevatedButton(
                          child:Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ) ,
                          onPressed: ()async{
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3F7AAD),
                            minimumSize: Size(350, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Set border radius to zero for rectangular shape
                            ),
                          ),
                        ),
                      ),

                      Container(
                        key: Key('footer-text'),
                        child:Row(
                          children: [
                            Text(
                              'New to A2SV?',
                              style: TextStyle(

                              ),
                            ),
                            TextButton(
                              key: Key('register-button'),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.indigoAccent
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
        )
    );
  }
}
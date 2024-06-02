
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
                  child: Center(
                    child: Image.network(
                      'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS-v7mV0cWa8gxS5ZiOCErG6s9W2dJDdAdbNceLtcTO87bnzpsp', // Replace with your image URL
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Text('Failed to load image');
                      },
                    ),
                  ),
                ),
                Container(
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
                        child:Row(
                          children: [
                            Text(
                              'New to A2SV?',
                              style: TextStyle(

                              ),
                            ),
                            TextButton(
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
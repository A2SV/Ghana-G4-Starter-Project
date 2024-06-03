import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Image.asset('lib/images/cuate.png',),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Thank You!",
                       style: TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                       ),),
                       SizedBox(height: 10,),
                         Text('User Registration Successful,continue to next login',
                         style: TextStyle(
                           fontSize: 12,
                        ),),],
                   )
                    ],
                    ),
          ),
          const SizedBox(height: 24,),
          Container(
            width: 350,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(38, 79, 173, 1),
                Color.fromRGBO(77, 148, 173, 1),
              ]),
           
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(23.0),
              child: Center(child: Text("Continue to Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),)),
            ),
          )

        ],),
    );
  }
}
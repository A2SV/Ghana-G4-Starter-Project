import 'package:flutter/material.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding3/components/background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Get Started",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Login with your credential ",
          style: TextStyle(
              fontSize: 15,
              color: Color(0xFF7D7D7D),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "to get started",
          style: TextStyle(
              fontSize: 15,
              color: Color(0xFF7D7D7D),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 5,
        ),
        Image.asset(
          'assets/images/superman.png',
          height: size.height * 0.4,
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          width: 340.0, // Adjust width as desired
          height: 60.0,
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(59, 99, 230, 0.649),
            onPressed: () {},
            child: Text(
              'Login',
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ));
  }
}

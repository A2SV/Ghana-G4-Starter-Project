import 'package:flutter/material.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding1/components/background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Welcome to ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const SizedBox(width: 10.0),
          const Text(
            'A2SV',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const SizedBox(height: 27),
          const Text(
            'Give review to items you like and',
            style: TextStyle(fontSize: 15, color: Color(0xFF7D7D7D)),
          ),
          const SizedBox(width: 10.0),
          const Text(
            'share with everyone!',
            style: TextStyle(fontSize: 15, color: Color(0xFF7D7D7D)),
          ),
          Image.asset(
            'assets/images/first_page.png',
            height: size.height * 0.5,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:starter_project/src/features/on_boarding/presentation/pages/on_boarding2/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't miss anything",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Write and read blogs to keep in ',
            style: TextStyle(fontSize: 15, color: Color(0xFF7D7D7D)),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'touch with other members',
            style: TextStyle(fontSize: 15, color: Color(0xFF7D7D7D)),
          ),
          SizedBox(height: 10,),
          Image.asset(
            'assets/images/second_page.png',
            height: size.height * 0.5,
          ),
        ],
      ),
    );
  }
}

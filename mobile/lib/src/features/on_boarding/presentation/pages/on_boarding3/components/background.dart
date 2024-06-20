import 'package:flutter/material.dart';

class background extends StatelessWidget {
  final Widget child;
  const background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/login_blob.png',
                width: size.width * 0.7,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/login_blob2.png',
                width: size.width * 0.35,
              )),
          child,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
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
              top: 80,
              left: 120,
              child: Image.asset(
                'assets/images/round_blob.png',
                width: size.width * 0.2,
              )),
          Positioned(
              bottom: 20,
              left: 0,
              child: Image.asset(
                'assets/images/yellow_blob.png',
                width: size.width * 0.5,
              )),
          child,
        ],
      ),
    );
  }
}

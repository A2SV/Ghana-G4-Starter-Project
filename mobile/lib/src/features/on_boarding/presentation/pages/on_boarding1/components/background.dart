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
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/blue_blob.png',
                width: size.width * 0.6,
              )),
          Positioned(
            bottom: 60,
            right: 40,
            child: Image.asset(
              'assets/images/purple_blob.png',
              width: size.width * 0.18,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

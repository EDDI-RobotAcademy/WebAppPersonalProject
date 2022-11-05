import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -500,
            left: -500,
            child: Image.asset("assets/images/signin/signin_screen1.png"),
          ),
          Positioned(
            top: 200,
            left: -150,
            child: Image.asset("assets/images/signin/signin_screen2.png"),
          ),
          child,
        ],
      ),
    );
  }
}
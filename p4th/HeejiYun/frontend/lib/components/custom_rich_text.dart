import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget{
  const CustomRichText({Key? key, required this.text, required this.route}) : super(key: key);
  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: text,
            style: TextStyle(color: Colors.black),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, route);
              }),
      ]),
    );
  }

}
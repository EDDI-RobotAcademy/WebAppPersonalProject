import 'package:flutter/material.dart';

class MypageTextbutton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  const MypageTextbutton(
      {Key? key, required this.text, required this.textColor, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

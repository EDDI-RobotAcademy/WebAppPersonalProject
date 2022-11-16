import 'package:demo/app_theme.dart';
import 'package:flutter/material.dart';

class MypageBackground extends StatelessWidget {
  final Widget child;
  const MypageBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppTheme.chalk,
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -size.height*0.2,
            left: -size.width*0.1,
            child: Image.asset("assets/images/mypage/mypage_background.png"),
          ),
          child,
        ],
      ),
    );
  }
}

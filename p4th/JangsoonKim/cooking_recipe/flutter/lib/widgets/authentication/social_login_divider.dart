import 'package:flutter/material.dart';

import '../../widgets/custom_divider.dart';

class SocialLoginDivider extends StatelessWidget {

  const SocialLoginDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          CustomDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "SNS 로그인",
              style:
              TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
            ),
          ),
          CustomDivider()
        ],
      ),
    );
  }
}
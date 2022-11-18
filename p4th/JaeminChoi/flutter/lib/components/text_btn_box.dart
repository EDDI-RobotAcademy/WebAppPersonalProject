import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/size.dart';

class TextBtnBoxRouter extends StatelessWidget{
  // 링크 연결 버튼 - text : 버튼이름 router : 연결 링크 설정
  const TextBtnBoxRouter({Key? key, required this.router, required this.text,}) : super(key: key);

  final String text;
  final String router;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            const SizedBox(height: small_gap,),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, router);
              },
              child: Text(text),
            )
          ],
        )
    );
  }
}
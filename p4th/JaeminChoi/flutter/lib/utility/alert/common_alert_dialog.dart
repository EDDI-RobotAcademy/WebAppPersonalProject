import 'package:flutter/material.dart';

import '../../pages/common_pages/sign_in_Page.dart';

class showCusTomDialog{
  AlertDialog showSignUpDialog(context) {
    return AlertDialog(
      title:Text("Congratulation!"),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text("회원 가입에 성공 하셨습니다"),
            Text("이제 로그인을 해볼까요?!"),
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage() ));},
            child: Text("SignIN"))
      ],
    );
  }
}
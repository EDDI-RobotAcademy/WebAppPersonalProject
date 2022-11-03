import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaing_helper/components/Forms/sign_in_form.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

import '../components/text_btn_box.dart';
import '../utility/size.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: const [
                SizedBox(height: xmedium_gap),
                SignInForm(),
                TextBtnBoxRouter(text: "회원 가입",router: "/sign_up_page",)
              ],
            )
        ),
      ),
    );
  }
}
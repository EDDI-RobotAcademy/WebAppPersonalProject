import 'package:flutter/material.dart';
import 'package:leaing_helper/components/text_form_filed/email_text_form_field.dart';

import '../components/Forms/sign_up_form.dart';
import '../components/text_btn_box.dart';
import '../utility/size.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body : SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column (
            children: const <Widget> [
              SizedBox(height: xmedium_gap),
              SignUpForm(),
            ],
          ),
        ),
      )
    );
  }
}
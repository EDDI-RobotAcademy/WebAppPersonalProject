import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/api/spring_api.dart';
import 'package:look_style/components/signIn/sign_in_email_text_form_field.dart';
import 'package:look_style/components/signIn/sign_in_password_text_form_field.dart';
import 'package:look_style/components/signUp/sign_up_email_text_form_field.dart';
import 'package:look_style/components/signUp/sign_up_form_field.dart';
import 'package:look_style/components/sign_up_drop_down_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("회원가입", style: TextStyle(fontFamily: "jua", fontSize: 40)),
                SizedBox(height: 80),
                SignUpFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/buttonStyle.dart';

import '../../api/spring_sign_in_api.dart';
import '../logo.dart';
import '../text_btn_box.dart';
import '../text_form_filed/email_text_form_field.dart';
import '../text_form_filed/password_text_form_field.dart';
import '../../utility/size.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Form(
        key: formkey,
        child: Column(
          children: [
            const Logo(title: "로그인",),
            const SizedBox(height: large_gap),
            const EmailTextFormField(widthSize: large_container_width,),
            const SizedBox(height: medium_gap),
            const PasswordTextFormField(widthSize: large_container_width),
            const SizedBox(height: medium_gap),
            ElevatedButton(
              onPressed: (){
                formkey.currentState?.save();
                SpringSignInApi().login(UserLoginRequest(EmailTextFormField.email , PasswordTextFormField.password));
                },
              child: const Text("로그인", style: TextStyle(color: Colors.white),),
              style: elevatedButtonStyle(),
            ),
          ],
        )
    );
  }

}
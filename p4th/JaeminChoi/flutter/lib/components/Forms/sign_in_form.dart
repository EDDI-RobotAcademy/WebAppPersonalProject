import 'package:flutter/material.dart';

import '../../api/spring_api.dart';
import '../logo.dart';
import '../text_form_filed/email_text_form_field.dart';
import '../text_form_filed/password_text_form_field.dart';
import '../../utility/size.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInState();
}

class _SignInState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Form(
        key: formkey,
        child: Column(
          children: [
            const Logo(title: "Leaning_Helper",),
            const SizedBox(height: large_gap),
            const EmailTextFormField(),
            const SizedBox(height: medium_gap),
            const PasswordTextFormField(),
            const SizedBox(height: medium_gap),
            ElevatedButton(
              onPressed: (){
                formkey.currentState?.save();
                SpringApi().login(UserLoginRequest(EmailTextFormField.email , PasswordTextFormField.password));
                },
              child: const Text("로그인", style: TextStyle(color: Colors.white),),
            )
          ],
        )
    );
  }

}
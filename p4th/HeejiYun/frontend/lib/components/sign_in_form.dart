import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/text_form_fields/text_form_field_email.dart';
import 'package:frontend/components/text_form_fields/text_form_field_password.dart';

import '../api/spring_member_api.dart';
import '../utility/size.dart';
import 'custom_alert_dialog.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late String? signInResponse;

  late String email;
  late String password;

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    }) ;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormFieldEmail(controller: emailController),
            const SizedBox(height: medium_gap,),
            TextFormFieldPassword(controller: passwordController),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  signInResponse = await SpringMemberApi().signIn(MemberSignInRequest(email, password));
                  if(signInResponse == null) {
                    showResultDialog(context, "로그인 실패!", "로그인 실패");
                  } else {
                    Navigator.pushNamed(context, "/home");
                  }
                }
              },
              child: const Text("로그인"),
            )
          ],
        )
    );
  }

  void showResultDialog(BuildContext context, String title, String alertMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(title: title, alertMsg: alertMsg)
    );
  }
}
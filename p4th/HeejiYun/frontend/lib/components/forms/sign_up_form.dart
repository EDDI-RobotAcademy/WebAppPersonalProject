import 'package:flutter/material.dart';
import 'package:frontend/components/custom_alert_dialog.dart';
import 'package:frontend/components/text_form_fields/text_form_field_email.dart';
import 'package:frontend/components/text_form_fields/text_form_field_nickname.dart';
import 'package:frontend/components/text_form_fields/text_form_field_password.dart';
import 'package:frontend/components/text_form_fields/text_form_field_password_check.dart';

import '../../api/spring_member_api.dart';
import '../../utility/size.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {

  late String email;
  late String password;
  late String nickname;

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController nicknameController = TextEditingController();

  bool? emailPass;
  bool? nicknamePass;
  bool? signUpSuccess;

  @override
  void initState() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
    nicknameController.addListener(() {
      nickname = nicknameController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormFieldEmail(controller: emailController,),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () async {
                emailPass = await SpringMemberApi().emailCheck( email );
                debugPrint("emailPass: " + emailPass.toString());

                if(emailPass == true) {
                  showResultDialog(context, "????????? ?????? ??????", "?????? ????????? ??????????????????.");
                  } else {
                  showResultDialog(context, "????????? ?????? ??????", "?????? ?????? ??????????????????.");
                }
                TextFormFieldEmail.emailFocus.unfocus();

              }, child: const Text("????????? ?????? ??????"),
            ),
            const SizedBox(height: medium_gap,),
            TextFormFieldPassword(controller: passwordController,),
            const SizedBox(height: medium_gap,),
            const TextFormFieldPasswordCheck(),
            const SizedBox(height: medium_gap,),
            TextFormFieldNickname(controller: nicknameController,),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () async {
                nicknamePass = await SpringMemberApi().nicknameCheck(nickname);
                debugPrint("nicknamePass: " + nicknamePass.toString());

                if(nicknamePass == true) {
                  showResultDialog(context, "????????? ?????? ??????", "?????? ????????? ??????????????????.");
                } else {
                  showResultDialog(context, "????????? ?????? ??????", "?????? ?????? ??????????????????.");
                }

                TextFormFieldNickname.nicknameFocus.unfocus();

              }, child: const Text("????????? ?????? ??????"),
            ),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if(emailPass == true && nicknamePass == true) {
                    signUpSuccess = await SpringMemberApi().signUp(MemberSignUpRequest(email, password, nickname));
                    if(signUpSuccess == true) {
                      Navigator.pushNamed(context, "/sign-up-complete");
                    }
                  } else if(emailPass == true && nicknamePass != true) {
                    showResultDialog(context, "???????????? ?????? ??? ??????", "????????? ?????? ????????? ???????????????!");
                  } else if(emailPass != true && nicknamePass == true) {
                    showResultDialog(context, "???????????? ?????? ??? ??????", "????????? ?????? ????????? ???????????????!");
                  } else {
                    showResultDialog(context, "???????????? ?????? ??? ??????", "?????????, ????????? ?????? ????????? ???????????????!");
                  }
                }
              },
              child: const Text("???????????? ??????"),
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
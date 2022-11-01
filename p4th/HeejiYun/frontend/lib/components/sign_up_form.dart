import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/text_form_field_email.dart';
import 'package:frontend/components/text_form_field_nickname.dart';
import 'package:frontend/components/text_form_field_password.dart';
import 'package:frontend/components/text_form_field_password_check.dart';

import '../api/spring_member_api.dart';
import '../utility/size.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  String email = '';
  String password = '';
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            const TextFormFieldEmail(),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () {
                debugPrint("email: " + email);
                SpringMemberApi().emailCheck(EmailCheckRequest(email));
              }, child: const Text("이메일 중복 확인",),
            ),
            const SizedBox(height: medium_gap,),
            const TextFormFieldPassword(),
            const SizedBox(height: medium_gap,),
            const TextFormFieldPasswordCheck(),
            const SizedBox(height: medium_gap,),
            const TextFormFieldNickname(),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () {
                debugPrint("닉네임 :" + nickname);
                SpringMemberApi().nicknameCheck(NicknameCheckRequest("닉네임"));
              }, child: const Text("닉네임 중복 확인",),
            ),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () {
                SpringMemberApi().signUp(MemberSignUpRequest(email, password, nickname));

                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: const Text("회원가입 하기"),
            )
          ],
        )
    );
  }
}
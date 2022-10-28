import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/text_form_field.dart';
import 'package:frontend/components/text_form_field_email.dart';
import 'package:frontend/components/text_form_field_password.dart';

import '../api/spring_api.dart';
import '../utility/size.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

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
                // debugPrint("email:" +);
                // SpringApi().emailCheck(EmailCheckRequest(TextFormFieldEmail.email));
              }, child: const Text("이메일 중복 확인",),
            ),
            const SizedBox(height: medium_gap,),
            const TextFormFieldPassword(),
            const SizedBox(height: medium_gap,),
            const CustomTextFormField(text: "비밀번호 확인"),
            const SizedBox(height: medium_gap,),
            const CustomTextFormField(text: "닉네임"),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () {
                SpringApi().nicknameCheck(NicknameCheckRequest("닉네임"));
              }, child: const Text("닉네임 중복 확인",),
            ),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () {
                SpringApi().signUp(MemberSignUpRequest("test44@gmail.com", "test44", "닉네임"));

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
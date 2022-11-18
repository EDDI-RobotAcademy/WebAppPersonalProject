import 'package:flutter/material.dart';

import '../../utility/validation.dart';

class SignUpPasswordTextFormField extends StatefulWidget {
  const SignUpPasswordTextFormField({Key? key, this.controller, this.confirmController, this.hintText}) : super(key: key);

  final String? hintText;
  final controller;
  final confirmController;

  @override
  State<SignUpPasswordTextFormField> createState() => _SignUpPasswordTextFieldState();
}

class _SignUpPasswordTextFieldState extends State<SignUpPasswordTextFormField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (text) => Validation().validatePassword(text!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: "비밀번호",
              hintText: "영문, 숫자, 특수문자를 포함한 8~16자를 입력해주세요",
              prefixIcon: Icon(Icons.lock_outline),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        ),
        SizedBox(height: 30,),
        TextFormField(
          controller: widget.confirmController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (text) {
            if(text!.isEmpty) {
              return "비밀번호를 다시 한번 입력해주세요.";
            } else if(text != widget.controller.text) {
              return "비밀번호가 일치하지 않습니다.";
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: "비밀번호 확인",
              hintText: "영문, 숫자, 특수문자를 포함한 8~16자를 입력해주세요",
              prefixIcon: Icon(Icons.lock),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        ),
      ],
    );
  }
}

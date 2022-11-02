import 'package:flutter/material.dart';
import 'package:look_style/utility/validation.dart';

class SignInPasswordTextFormField extends StatefulWidget {
  const SignInPasswordTextFormField({Key? key, this.controller}) : super(key: key);

  final controller;

  @override
  State<SignInPasswordTextFormField> createState() => _SignInPasswordTextFieldState();
}

class _SignInPasswordTextFieldState extends State<SignInPasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (text) => Validation().validatePassword(text!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: "Password",
          hintText: "비밀번호를 입력해주세요",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }
}

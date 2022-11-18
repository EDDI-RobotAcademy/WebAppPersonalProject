import 'package:flutter/material.dart';
import 'package:look_style/utility/validation.dart';

class SignInEmailTextFormField extends StatefulWidget {
  const SignInEmailTextFormField({Key? key, this.controller}) : super(key: key);

  final controller;

  @override
  State<SignInEmailTextFormField> createState() => _SignInEmailTextFieldState();
}

class _SignInEmailTextFieldState extends State<SignInEmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      validator: (text) => Validation().validateEmail(text!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "이메일을 입력해주세요",
          prefixIcon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }
}

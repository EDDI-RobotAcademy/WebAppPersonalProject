import 'package:flutter/material.dart';
import 'package:look_style/utility/validation.dart';

class SignInPasswordTextFormField extends StatefulWidget {
  const SignInPasswordTextFormField({Key? key, this.controller, this.hintText}) : super(key: key);

  final String? hintText;
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
      validator: (text) {
        Validation().validatePassword(text!);
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: widget.hintText,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
  }
}

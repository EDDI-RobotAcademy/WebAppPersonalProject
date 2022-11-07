import 'package:flutter/material.dart';
import 'package:look_style/utility/validation.dart';

class SignInPasswordTextFormField extends StatefulWidget {
  const SignInPasswordTextFormField({Key? key, this.controller}) : super(key: key);

  final controller;

  @override
  State<SignInPasswordTextFormField> createState() => _SignInPasswordTextFieldState();
}

class _SignInPasswordTextFieldState extends State<SignInPasswordTextFormField> {

  bool _obscureMode = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureMode,
      validator: (text) {
        if(text!.isEmpty) {
          return "비밀번호를 입력해주세요.";
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          suffixIconColor: Colors.black,
          suffixIcon: _obscureMode
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureMode = false;
                    });
                  },
                  icon: Icon(Icons.visibility_off_outlined),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureMode = true;
                    });
                  },
                  icon: Icon(Icons.visibility_outlined)
                ),
          prefixIcon: Icon(Icons.lock),
          labelText: "Password",
          hintText: "비밀번호를 입력해주세요",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }
}

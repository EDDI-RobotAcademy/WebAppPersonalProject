import 'package:demo/account/components/signupBody.dart';
import 'package:flutter/material.dart';

import '../../components/text_field_contanier.dart';
import '../../validate/check_validate.dart';
import 'loginBody.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hinText;

  RoundedPasswordField({Key? key, required this.onChanged, required this.hinText})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SignupBodyState? form = context.findAncestorStateOfType<SignupBodyState>();
    LoginBodyState? form2 = context.findAncestorStateOfType<LoginBodyState>();
    return TextFieldContanier(
        child: TextFormField(
          validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
          onChanged: (text) {
            form?.password = text;
            form2?.password = text;
          },
          obscureText: true,
          decoration: InputDecoration(
              hintText: widget.hinText,
              icon: Icon(
                Icons.lock,
                color: Colors.orange,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.orange,
              ),
              border: InputBorder.none
          ),

        ));
  }
}

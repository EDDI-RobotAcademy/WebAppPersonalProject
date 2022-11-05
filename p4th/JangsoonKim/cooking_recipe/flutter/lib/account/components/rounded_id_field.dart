import 'package:demo/account/components/loginBody.dart';
import 'package:demo/account/components/signupBody.dart';
import 'package:demo/components/text_field_contanier.dart';
import 'package:flutter/material.dart';

import '../../validate/check_validate.dart';

class RoundedIdField extends StatefulWidget {
  final String hinText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  RoundedIdField(
      {Key? key,
      required this.hinText,
      this.icon = Icons.person,
      required this.onChanged})
      : super(key: key);

  @override
  State<RoundedIdField> createState() => _RoundedIdFieldState();
}

class _RoundedIdFieldState extends State<RoundedIdField> {
  final FocusNode _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SignupBodyState? form = context.findAncestorStateOfType<SignupBodyState>();
    LoginBodyState? form2 = context.findAncestorStateOfType<LoginBodyState>();
    return TextFieldContanier(
        child: TextFormField(
      validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
      onChanged: (text) {
        form?.email = text;
        form2?.email = text;
      },
      decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: Colors.orange,
          ),
          hintText: widget.hinText,
          border: InputBorder.none),
    ));
  }
}

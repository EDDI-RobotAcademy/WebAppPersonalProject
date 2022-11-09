import 'package:demo/widgets/authentication/signup_form.dart';
import 'package:flutter/material.dart';

import '../../utilities/check_validate.dart';
import '../../widgets/text_field_contanier.dart';
import 'login_form.dart';

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
    SignupFormState? signup = context.findAncestorStateOfType<SignupFormState>();
    LoginFormState? login = context.findAncestorStateOfType<LoginFormState>();
    return TextFieldContanier(
        child: TextFormField(
      validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (text) {
        signup?.email = text;
        login?.email = text;
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

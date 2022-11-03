import 'package:demo/components/text_field_contanier.dart';
import 'package:flutter/material.dart';

import '../../validate/check_validate.dart';

class RoundedIdField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FocusNode _emailFocus = new FocusNode();

  RoundedIdField(
      {Key? key,
      required this.hinText,
      this.icon = Icons.person,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContanier(
        child: TextFormField(
      validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
      onChanged: onChanged,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.orange,
          ),
          hintText: hinText,
          border: InputBorder.none),
    ));
  }
}

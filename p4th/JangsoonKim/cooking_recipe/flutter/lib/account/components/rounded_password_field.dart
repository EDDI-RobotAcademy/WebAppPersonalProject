import 'package:flutter/material.dart';

import '../../components/text_field_contanier.dart';
import '../../validate/check_validate.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hinText;
  final FocusNode _passwordFocus = new FocusNode();

  RoundedPasswordField({Key? key, required this.onChanged, required this.hinText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContanier(
        child: TextFormField(
          validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
          onChanged: onChanged,
          obscureText: true,
          decoration: InputDecoration(
              hintText: hinText,
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

import 'package:demo/components/text_field_contanier.dart';
import 'package:flutter/material.dart';

import '../../validate/check_validate.dart';

class RoundedNicknameField extends StatelessWidget {

  final String hinText;
  final ValueChanged<String> onChanged;
  final FocusNode _nickNameFocus = new FocusNode();

  RoundedNicknameField({Key? key, required this.hinText, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContanier(
        child: TextFormField(
      validator: (value) => CheckValidate().validateNickName(_nickNameFocus, value!),
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hinText,
              border: InputBorder.none
          ),
    ));
  }
}

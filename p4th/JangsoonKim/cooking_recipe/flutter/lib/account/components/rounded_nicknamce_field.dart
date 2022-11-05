import 'package:demo/account/components/signupBody.dart';
import 'package:demo/components/text_field_contanier.dart';
import 'package:flutter/material.dart';

import '../../validate/check_validate.dart';

class RoundedNicknameField extends StatefulWidget {
  final String hinText;
  final ValueChanged<String> onChanged;

  RoundedNicknameField(
      {Key? key, required this.hinText, required this.onChanged})
      : super(key: key);

  @override
  State<RoundedNicknameField> createState() => _RoundedNicknameFieldState();
}

class _RoundedNicknameFieldState extends State<RoundedNicknameField> {
  final FocusNode _nickNameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SignupBodyState? form = context.findAncestorStateOfType<SignupBodyState>();
    return TextFieldContanier(
        child: TextFormField(
      validator: (value) =>
          CheckValidate().validateNickName(_nickNameFocus, value!),
          onChanged: (text) {
            form?.nickname = text;
          },
      decoration:
          InputDecoration(hintText: widget.hinText, border: InputBorder.none),
    ));
  }
}

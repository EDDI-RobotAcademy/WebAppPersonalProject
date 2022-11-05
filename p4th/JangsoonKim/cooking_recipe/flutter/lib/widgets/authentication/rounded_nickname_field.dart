import 'package:demo/widgets/authentication/signup_form.dart';
import 'package:flutter/material.dart';

import '../../utilities/check_validate.dart';
import '../../widgets/text_field_contanier.dart';

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
    SignupFormState? signupForm = context.findAncestorStateOfType<SignupFormState>();
    return TextFieldContanier(
        child: TextFormField(
      validator: (value) =>
          CheckValidate().validateNickName(_nickNameFocus, value!),
          onChanged: (text) {
            signupForm?.nickname = text;
          },
      decoration:
          InputDecoration(hintText: widget.hinText, border: InputBorder.none),
    ));
  }
}

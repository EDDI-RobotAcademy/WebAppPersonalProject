import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';
import '../../utility/input_validate.dart';


class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({Key? key}) : super(key: key);

  static String password = '';

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {

  FocusNode _passwordFocus = new FocusNode();
  var textFieldStyle = textFormDecoration('password를 입력해주세요.');

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: textFieldStyle,
      keyboardType: TextInputType.emailAddress,
      focusNode:_passwordFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
      obscureText: true,
      onSaved: (value) {
        setState(() {
          TextFieldPassword.password = value!;
        });
      },
    );
  }

}


import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';
import '../../utility/input_validate.dart';


class TextFieldEmail extends StatefulWidget {
  const TextFieldEmail({Key? key}) : super(key: key);

  static String email = '';

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {

  FocusNode _emailFocus = new FocusNode();
  var textFieldStyle = textFormDecoration('email을 입력해주세요.');

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: textFieldStyle,
      keyboardType: TextInputType.emailAddress,
      focusNode:_emailFocus,
      validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) {
        setState(() {
          TextFieldEmail.email = value!;
        });
      },
    );
  }

}


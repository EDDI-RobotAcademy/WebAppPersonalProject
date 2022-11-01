import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';



class TextFieldCheckedPassword extends StatefulWidget {
  const TextFieldCheckedPassword({Key? key}) : super(key: key);

  static String checkedPassword = '';

  @override
  State<TextFieldCheckedPassword> createState() => _TextFieldCheckedPasswordState();
}

class _TextFieldCheckedPasswordState extends State<TextFieldCheckedPassword> {

  FocusNode _checkedPasswordFocus = new FocusNode();
  var textFieldStyle = textFormDecoration('다시 한번 password를 입력해주세요.');

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: textFieldStyle,
      keyboardType: TextInputType.visiblePassword,
      focusNode:_checkedPasswordFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) =>
      // TextFieldPassword.password == checkedPassword ? '틀렸습니다.' : null,
      obscureText: true,
      onSaved: (value) {
        setState(() {
          TextFieldCheckedPassword.checkedPassword = value!;
        });
      },
    );
  }

}


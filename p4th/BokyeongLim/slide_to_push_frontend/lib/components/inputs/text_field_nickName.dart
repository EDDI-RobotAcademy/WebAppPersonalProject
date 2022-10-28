import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';

import '../../utility/input_validate.dart';


class TextFieldCommon extends StatefulWidget {
  TextFieldCommon({Key? key}) : super(key: key);

  static String message = '';

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {

  FocusNode _nickNameFocus = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:textFormDecoration("닉네임을 입력해주세요." ),
      keyboardType: TextInputType.emailAddress,
      focusNode:_nickNameFocus,
      validator: (value) => CheckValidate().validateText(_nickNameFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) {
        setState(() {
          TextFieldCommon.message = value!;
        });
      },
    );
  }
}



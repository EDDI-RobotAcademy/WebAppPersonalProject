import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';

import '../../utility/input_validate.dart';


class TextFieldCommon extends StatefulWidget {
  final String formName;
  static String enteredMessage = '';

  TextFieldCommon({
    Key? key,
    required this.formName,
  }) : super(key: key);

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {

  var formName = '';

  @override
  void initState() {
    super.initState();
    formName = widget.formName;
  }

  FocusNode _thisTextFieldFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:textFormDecoration('$formName 입력해주세요.'),
      keyboardType: TextInputType.emailAddress,
      focusNode:_thisTextFieldFocus,
      validator: (value) => CheckValidate().validateText(_thisTextFieldFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) {
        setState(() {
          TextFieldCommon.enteredMessage = value!;
        });
      },
    );
  }
}



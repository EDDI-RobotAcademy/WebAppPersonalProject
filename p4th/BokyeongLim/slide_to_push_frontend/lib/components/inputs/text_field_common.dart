import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';

import '../../utility/input_validate.dart';


class TextFieldCommon extends StatefulWidget {
  final TextEditingController controller;
  final String formName;

  TextFieldCommon({
    Key? key,
    required this.controller,
    required this.formName,
  }) : super(key: key);

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {

  late FocusNode textFocus;
  var formName = '';
  var controller;

  @override
  void initState() {
    super.initState();
    formName = widget.formName;
    controller = widget.controller;
    textFocus = FocusNode();
  }

  @override
  void dispose() {
    textFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:textFormDecoration('$formName 입력해주세요.'),
      keyboardType: TextInputType.emailAddress,
      focusNode:textFocus,
      validator: (value) => CheckValidate().validateText(textFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) {
        setState(() {
          controller.text = value;
        });
      },
    );
  }
}



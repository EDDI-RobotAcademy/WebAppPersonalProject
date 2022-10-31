import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';
import '../../utility/input_validate.dart';


class TextFieldEmail extends StatefulWidget {
  final TextEditingController controller;

  TextFieldEmail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {

  late FocusNode emailFocus;
  var textFieldStyle = textFormDecoration('email을 입력해주세요.');
  var controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    emailFocus = FocusNode();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: textFieldStyle,
      keyboardType: TextInputType.emailAddress,
      focusNode:emailFocus,
      validator: (value) => CheckValidate().validateEmail(emailFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        setState(() {
          controller.text = value;
        });
      },
      // onChanged: (value) => setState(()=> controller.text = value)
    );
  }

}


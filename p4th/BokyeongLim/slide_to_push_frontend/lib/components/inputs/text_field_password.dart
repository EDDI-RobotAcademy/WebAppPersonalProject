import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';
import '../../utility/input_validate.dart';


class TextFieldPassword extends StatefulWidget {
  final TextEditingController controller;

  const TextFieldPassword({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {

  late FocusNode passwordFocus;
  var textFieldStyle = textFormDecoration('password를 입력해주세요.');
  var controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      decoration: textFieldStyle,
      keyboardType: TextInputType.visiblePassword,
      focusNode:passwordFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => CheckValidate().validatePassword(passwordFocus, value!),
      obscureText: true,
      onSaved: (value) {
        setState(() {
          controller.text = value!;
        });
      },
    );
  }

}


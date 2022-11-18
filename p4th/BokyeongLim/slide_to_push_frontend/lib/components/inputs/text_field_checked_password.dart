import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/decoration.dart';



class TextFieldCheckedPassword extends StatefulWidget {
  final TextEditingController controller;

  const TextFieldCheckedPassword({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldCheckedPassword> createState() => _TextFieldCheckedPasswordState();
}

class _TextFieldCheckedPasswordState extends State<TextFieldCheckedPassword> {

  late FocusNode checkedPasswordFocus;
  var textFieldStyle = textFormDecoration('password를 입력해주세요.');
  var controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    checkedPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    checkedPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      decoration: textFieldStyle,
      keyboardType: TextInputType.visiblePassword,
      focusNode:checkedPasswordFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) =>
      // TextFieldPassword.password == checkedPassword ? '틀렸습니다.' : null,
      obscureText: true,
      onSaved: (value) {
        setState(() {
          controller.text = value!;
        });
      },
    );
  }

}


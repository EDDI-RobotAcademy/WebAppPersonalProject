import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utility/size.dart';
import '../../utility/validate.dart';

class TextFormFieldPassword extends StatefulWidget {
  const TextFormFieldPassword({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("비밀번호"),
        const SizedBox(height: small_gap,),
        TextFormField(
          controller: widget.controller,
          obscureText: true,
          validator: (value) => CheckValidate().validatePassword(value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: "Enter password",
            enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    );
  }
}
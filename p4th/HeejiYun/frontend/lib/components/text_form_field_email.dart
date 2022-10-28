import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/size.dart';
import '../utility/validate.dart';

class TextFormFieldEmail extends StatefulWidget {
  const TextFormFieldEmail({Key? key}) : super(key: key);

  @override
  State<TextFormFieldEmail> createState() => _TextFormFieldEmailState();
}

class _TextFormFieldEmailState extends State<TextFormFieldEmail> {

  FocusNode _emailFocus = FocusNode();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("이메일"),
        const SizedBox(height: small_gap,),
        TextFormField(
          controller: email,
          focusNode: _emailFocus,
          validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: "Enter email",
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
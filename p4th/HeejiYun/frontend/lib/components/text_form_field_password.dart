import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/sign_up_form.dart';

import '../utility/size.dart';
import '../utility/validate.dart';

class TextFormFieldPassword extends StatefulWidget {
  const TextFormFieldPassword({Key? key}) : super(key: key);

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {

  FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SignUpFormState? form = context.findAncestorStateOfType<SignUpFormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("비밀번호"),
        const SizedBox(height: small_gap,),
        TextFormField(
          focusNode: _passwordFocus,
          obscureText: true,
          validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (text) {
            form?.password = text;
          },
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
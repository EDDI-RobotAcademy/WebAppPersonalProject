import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/forms/sign_up_form.dart';

import '../../utility/size.dart';
import '../../utility/validate.dart';

class TextFormFieldEmail extends StatefulWidget {
  const TextFormFieldEmail({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  static FocusNode emailFocus = FocusNode();

  @override
  State<TextFormFieldEmail> createState() => _TextFormFieldEmailState();
}

class _TextFormFieldEmailState extends State<TextFormFieldEmail> {

  @override
  Widget build(BuildContext context) {
    SignUpFormState? form = context.findAncestorStateOfType<SignUpFormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("이메일"),
        const SizedBox(height: small_gap,),
        TextFormField(
          controller: widget.controller,
          focusNode: TextFormFieldEmail.emailFocus,
          validator: (value) => CheckValidate().validateEmail(value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (text) {
            form?.emailPass = false;
          },
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
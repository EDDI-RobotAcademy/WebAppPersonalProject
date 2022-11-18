import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/forms/sign_up_form.dart';

import '../../utility/size.dart';
import '../../utility/validate.dart';

class TextFormFieldNickname extends StatefulWidget {
  const TextFormFieldNickname({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  static FocusNode nicknameFocus = FocusNode();

  @override
  State<TextFormFieldNickname> createState() => _TextFormFieldNicknameState();
}

class _TextFormFieldNicknameState extends State<TextFormFieldNickname> {

  @override
  Widget build(BuildContext context) {
    SignUpFormState? form = context.findAncestorStateOfType<SignUpFormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("닉네임"),
        const SizedBox(height: small_gap,),
        TextFormField(
          focusNode: TextFormFieldNickname.nicknameFocus,
          controller: widget.controller,
          validator: (value) => CheckValidate().
          validateNickname(value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (text) {
            form?.nicknamePass = false;
          },
          decoration: InputDecoration(
            hintText: "Enter nickname",
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
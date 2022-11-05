import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/sign_up_form.dart';

import '../../utility/size.dart';
import '../../utility/validate.dart';

class TextFormFieldNickname extends StatefulWidget {
  const TextFormFieldNickname({Key? key}) : super(key: key);

  @override
  State<TextFormFieldNickname> createState() => _TextFormFieldNicknameState();
}

class _TextFormFieldNicknameState extends State<TextFormFieldNickname> {
  FocusNode _nicknameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SignUpFormState? form = context.findAncestorStateOfType<SignUpFormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("닉네임"),
        const SizedBox(height: small_gap,),
        TextFormField(
          focusNode: _nicknameFocus,
          validator: (value) => CheckValidate().validateNickname(_nicknameFocus, value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (text) {
            form?.nickname = text;
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/forms/sign_up_form.dart';

import '../../utility/size.dart';

class TextFormFieldPasswordCheck extends StatefulWidget {
  const TextFormFieldPasswordCheck({Key? key}) : super(key: key);

  @override
  State<TextFormFieldPasswordCheck> createState() => _TextFormFieldPasswordCheckState();
}

class _TextFormFieldPasswordCheckState extends State<TextFormFieldPasswordCheck> {

  FocusNode _passwordCheckFocus = FocusNode();

  @override
  void dispose() {
    _passwordCheckFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignUpFormState? form = context.findAncestorStateOfType<SignUpFormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("비밀번호 확인"),
        const SizedBox(height: small_gap,),
        TextFormField(
          focusNode: _passwordCheckFocus,
          obscureText: true,
          validator: (value) => value != form?.password ? "비밀번호가 일치하지 않습니다.": null,
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
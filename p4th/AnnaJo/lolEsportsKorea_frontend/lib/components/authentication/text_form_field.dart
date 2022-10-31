import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: (value) => value!.isEmpty ? "값을 입력하세요" : null,
          obscureText: text == "Password" ? true : false,
          decoration: InputDecoration(
            hintText: "Please enter $text",
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

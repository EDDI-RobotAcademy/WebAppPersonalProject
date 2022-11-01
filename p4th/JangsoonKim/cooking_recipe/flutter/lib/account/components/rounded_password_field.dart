import 'package:flutter/material.dart';

import '../../components/text_field_contanier.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContanier(
        child: TextField(
          onChanged: onChanged,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: "비밀번호",
              icon: Icon(
                Icons.lock,
                color: Colors.orange,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.orange,
              ),
              border: InputBorder.none
          ),

        ));
  }
}

import 'package:demo/widgets/authentication/signup_form.dart';
import 'package:flutter/material.dart';

import '../../utilities/check_validate.dart';
import '../../widgets/text_field_contanier.dart';
import 'login_form.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hinText;

  const RoundedPasswordField({Key? key, required this.onChanged, required this.hinText})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SignupFormState? signupForm = context.findAncestorStateOfType<SignupFormState>();
    LoginFormState? loginForm = context.findAncestorStateOfType<LoginFormState>();
    return TextFieldContanier(
        child: TextFormField(
          validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
          onChanged: (text) {
            signupForm?.password = text;
            loginForm?.password = text;
          },
          obscureText: true,
          decoration: InputDecoration(
              hintText: widget.hinText,
              icon: const Icon(
                Icons.lock,
                color: Colors.orange,
              ),
              suffixIcon: const Icon(
                Icons.visibility,
                color: Colors.orange,
              ),
              border: InputBorder.none
          ),

        ));
  }
}

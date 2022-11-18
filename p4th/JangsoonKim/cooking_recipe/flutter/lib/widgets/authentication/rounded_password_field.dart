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
  bool? _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SignupFormState? signupForm = context.findAncestorStateOfType<SignupFormState>();
    LoginFormState? loginForm = context.findAncestorStateOfType<LoginFormState>();
    return TextFieldContanier(
        child: TextFormField(
          validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (text) {
            signupForm?.password = text;
            loginForm?.password = text;
          },
          obscureText: !_passwordVisible!,
          decoration: InputDecoration(
              hintText: widget.hinText,
              icon: const Icon(
                Icons.lock,
                color: Colors.orange,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible! ? Icons.visibility : Icons.visibility_off,
                  color: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible!;
                  });
                },
              ),
              border: InputBorder.none
          ),

        ));
  }
}

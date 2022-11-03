import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/components/authentication/text_form_field.dart';
import 'package:lol_esports_korea_app/utility/size.dart';

import '../../api/authentication/spring_sign_in_api.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Color bgColor = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _formKey,
      children: [
        const CustomTextFormField(text: "E-mail"),
        const SizedBox(height: large_gap),
        const CustomTextFormField(text: "Password"),
        const SizedBox(height: xmedium_gap),
        CupertinoButton.filled(
          onPressed: () {
            // setState(() {
            //   bgColor = Colors.black;
            // });
            if (_formKey.currentState!.validate()) {
              Navigator.pushNamed(context, "/home");
            }
            // 눌렀을 때 스프링 연결
            // SpringApi().login(UserLoginRequest(emailController.text, passwordController.text));
          },
          child: const Text("Sign In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),

          ),
        )
      ],
    );
  }
}

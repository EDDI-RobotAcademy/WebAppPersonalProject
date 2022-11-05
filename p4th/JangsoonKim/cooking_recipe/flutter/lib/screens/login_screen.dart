import 'package:flutter/material.dart';

import '../widgets/authentication/login_form.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
          child: LoginForm()),
    );
  }
}


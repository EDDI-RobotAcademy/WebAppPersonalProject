import 'package:demo/account/components/background.dart';
import 'package:demo/account/components/loginBody.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: LoginBody()
    );
  }
}


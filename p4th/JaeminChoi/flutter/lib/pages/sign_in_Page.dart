import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaing_helper/components/Forms/sign_in_form.dart';
import 'package:leaing_helper/utility/color.dart';

import '../utility/size.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: const [
                SizedBox(height: 80),
                SignInForm(),
              ],
            )
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/logo.dart';
import '../components/sign_in_form.dart';
import '../utility/size.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
            child: ListView(
              children: const [
                SizedBox(height: xlarge_gap,),
                Logo(title: "로그인"),
                SizedBox(height: small_gap,),
                SignInForm(),
              ],
            ),
          )
        );
  }
}
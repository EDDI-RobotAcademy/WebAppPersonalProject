import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/forms/sign_up_form.dart';
import '../components/logo.dart';
import '../utility/size.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: CommonAppBar(title: "SIGN UP PAGE"),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                SizedBox(height: small_gap,),
                Logo(title: "회원 가입",),
                SizedBox(height: small_gap,),
                SignUpForm(),
              ],
            ),
          ),
        drawer: CustomDrawer()
      );
  }
}

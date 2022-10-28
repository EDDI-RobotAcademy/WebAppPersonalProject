import 'package:flutter/material.dart';

import '../components/logo.dart';
import '../components/text_form_field.dart';
import '../utility/color.dart';
import '../utility/form_validate.dart';
import '../utility/size.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color:colorStyle.darkNavy,
                    width: 3.0,)
            ),
            child:  ListView(
              key: formkey,
              children : [
                const SizedBox(height: medium_gap,),
                const Logo(title: "Leaning_helper",),
                const SizedBox(height: large_gap,),
                CustomTextFormField(text: "Email",),
                CustomTextFormField(text: "Password",),

              ],
            )
        ),
      ),
    );
  }

}
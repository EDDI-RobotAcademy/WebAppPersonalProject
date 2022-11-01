import 'package:flutter/material.dart';

import 'package:slide_to_push_frontend/components/inputs/text_field_email.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_password.dart';

import 'package:slide_to_push_frontend/utility/buttons.dart';
import 'package:slide_to_push_frontend/utility/routes.dart';
import 'package:slide_to_push_frontend/utility/size.dart';

import 'package:slide_to_push_frontend/api/spring_api.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late TextEditingController emailEditController;

  @override
  void initState() {
    super.initState();
    emailEditController = TextEditingController();
  }

  @override
  void dispose() {
    emailEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFieldEmail(controller: emailEditController,),
            SizedBox(height: medium_gap),
            TextFieldPassword(),
            SizedBox(height: medium_gap),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(Routes.signUp);
                  },
                  child: Text('SIGN UP'),
                  style: Buttons.defaultTextButton,
                ),
                TextButton(
                    onPressed: (){},
                    child: Text('FORGOT PASSWORD'),
                    style: Buttons.defaultTextButton,
                )
              ],
            ),
            SizedBox(height: medium_gap),
            ElevatedButton(
              onPressed:(){
                formKey.currentState?.save();
                SpringApi().signIn(SignInRequest(emailEditController.text, TextFieldPassword.password));
              },
              child:Text("SIGN IN", style: TextStyle(color: Colors.white,)),
              style: Buttons.defaultButton,
            )
          ],
        )
    );
  }
}

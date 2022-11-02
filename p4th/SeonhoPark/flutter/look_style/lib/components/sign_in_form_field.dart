import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/api/spring_api.dart';
import 'package:look_style/components/sign_in_email_text_form_field.dart';
import 'package:look_style/components/sign_in_password_text_form_field.dart';

class SignInFormField extends StatefulWidget {
  const SignInFormField({Key? key}) : super(key: key);

  @override
  State<SignInFormField> createState() => _SignInFormFieldState();
}

class _SignInFormFieldState extends State<SignInFormField> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final focusnode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SignInEmailTextFormField(controller: emailController),
          SizedBox(height: 30),
          SignInPasswordTextFormField(controller: passwordController,),
          SizedBox(height: 50),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  primary: Colors.indigo
              ),
              onPressed: () {
                SignInSpringApi().login(UserLoginRequest(emailController.text, passwordController.text));

                if(_formKey.currentState!.validate()) {
                    Get.toNamed('/main');
                }
              },
              child: Text("로그인")
          )
        ],
      ),
    );
  }
}


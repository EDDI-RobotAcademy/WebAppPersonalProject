import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/api/spring_api.dart';
import 'package:look_style/components/signUp/sign_up_email_text_form_field.dart';
import 'package:look_style/components/signUp/sign_up_nickname_text_form_field.dart';
import 'package:look_style/components/signUp/sign_up_password_text_form_field.dart';
import 'package:look_style/pages/sign_in_page.dart';

class SignUpFormField extends StatefulWidget {
  SignUpFormField({Key? key}) : super(key: key);

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nicknameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SignUpEmailTextFormField(controller: emailController),
          SizedBox(height: 30),
          SignUpPasswordTextFormField(
            controller: passwordController,
            confirmController: confirmPasswordController
          ),
          SizedBox(height: 30),
          SignUpNicknameTextFormField(controller: nicknameController),
          SizedBox(height: 50,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  primary: Colors.indigo
              ),
              onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (SignUpEmailTextFormField.buttonStatus == true && SignUpNicknameTextFormField.buttonStatus == true) {
                  var validation = SpringApi().signUp(UserSignUpRequest(
                      emailController.text,
                      confirmPasswordController.text,
                      nicknameController.text));
                  validation.then((value) {
                    if (value.success == true) {
                      Get.off(SignInPage());
                    } else {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                "오류 발생",
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("확인"),
                                ),
                              ],
                            );
                          });
                    }
                  });
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "중복확인을 진행해주세요",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("확인"),
                            ),
                          ],
                        );
                      });
                }
              }
            },
            child: Text("가입하기"),
          )
        ],
      ),
    );
  }
}

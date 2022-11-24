import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:look_style/api/member_spring_api.dart';
import 'package:look_style/components/signIn/sign_in_email_text_form_field.dart';
import 'package:look_style/components/signIn/sign_in_password_text_form_field.dart';

class SignInFormField extends StatefulWidget {
  SignInFormField({Key? key, required this.storage}) : super(key: key);

  FlutterSecureStorage storage;

  @override
  State<SignInFormField> createState() => _SignInFormFieldState();
}

class _SignInFormFieldState extends State<SignInFormField> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                if (_formKey.currentState!.validate()) {
                  var userInfo = MemberSpringApi().signIn(UserSignInRequest(emailController.text, passwordController.text));

                  userInfo.then((value) async {
                    if (value != null) {
                      await widget.storage.write(key: 'userToken', value: value.token);
                      await widget.storage.write(key: 'userEmail', value: value.email);
                      await widget.storage.write(key: 'userNickname', value: value.nickname);
                      Get.offNamed('/main', arguments: [value.email, value.nickname]);
                    } else {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              content: Text(
                                "입력한 정보가 맞지 않습니다.",
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("확인", style: TextStyle(color: Colors.black),),
                                ),
                              ],
                            );
                          });
                    }
                  });
                }
              },
              child: Text("로그인")
          )
        ],
      ),
    );
  }
}


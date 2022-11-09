import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/components/text_form_fields/text_form_field_email.dart';
import 'package:frontend/components/text_form_fields/text_form_field_password.dart';

import '../api/spring_member_api.dart';
import '../utility/size.dart';
import 'custom_alert_dialog.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  static FlutterSecureStorage storage = FlutterSecureStorage();
  dynamic userInfo = '';

  late SignInResponse signInResponse;

  late String email;
  late String password;

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    }) ;
    
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }

  _asyncMethod() async {
    userInfo = await storage.read(key: 'login');
    debugPrint(userInfo);
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormFieldEmail(controller: emailController),
            const SizedBox(height: medium_gap,),
            TextFormFieldPassword(controller: passwordController),
            const SizedBox(height: medium_gap,),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() && userInfo == null) {
                  signInResponse = await SpringMemberApi().signIn(MemberSignInRequest(email, password));
                  if(signInResponse.userToken.toString() == "1") {
                    showResultDialog(context, "로그인 실패!", "가입된 사용자 아님");
                  } else if (signInResponse.userToken.toString() == "2") {
                    showResultDialog(context, "로그인 실패!", "일치하지 않는 패스워드");
                  } else {
                    storage.write(key: 'login', value: signInResponse.userToken.toString());
                    Navigator.pushNamed(context, "/home");
                  }
                } else if(userInfo != null){
                  showResultDialog(context, "로그인 실패!", "이미 로그인 중입니다.");
                }
              },
              child: const Text("로그인"),
            ),
            TextButton(
              onPressed: () async {
                await storage.deleteAll();
                userInfo = await storage.read(key: 'login');
              },
              child: const Text("storage 삭제(임시)")
            ),
          ],
        )
    );
  }

  void showResultDialog(BuildContext context, String title, String alertMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(title: title, alertMsg: alertMsg)
    );
  }
}
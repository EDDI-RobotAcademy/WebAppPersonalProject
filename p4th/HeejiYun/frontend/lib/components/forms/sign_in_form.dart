import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/text_form_fields/text_form_field_email.dart';
import 'package:frontend/components/text_form_fields/text_form_field_password.dart';
import 'package:provider/provider.dart';

import '../../api/spring_member_api.dart';
import '../../utility/providers/login_data_provider.dart';
import '../../utility/secure_storage.dart';
import '../../utility/size.dart';
import '../custom_alert_dialog.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final String noEmail = "1";
  final String passwordMiss = "2";

  late SignInResponse signInResponse;

  late String email;
  late String password;

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  late LoginDataProvider _loginDataProvider;

  @override
  void initState() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });

    _loginDataProvider = Provider.of<LoginDataProvider>(context, listen: false);

    super.initState();
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
            const SizedBox(
              height: medium_gap,
            ),
            TextFormFieldPassword(controller: passwordController),
            const SizedBox(
              height: medium_gap,
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() && _loginDataProvider.loginState == false) {
                  signInResponse = await SpringMemberApi()
                      .signIn(MemberSignInRequest(email, password));
                  if (signInResponse.userToken.toString() == noEmail) {
                    showResultDialog(context, "로그인 실패!", "가입된 사용자 아님");
                  } else if (signInResponse.userToken.toString() == passwordMiss) {
                    showResultDialog(context, "로그인 실패!", "일치하지 않는 패스워드");
                  } else {
                    SecureStorage.storage.write(
                        key: 'login',
                        value: signInResponse.userToken.toString());
                        _loginDataProvider.setUserToken(signInResponse.userToken.toString());
                        _loginDataProvider.isLogin();

                    debugPrint("userToken after signin: " + _loginDataProvider.userToken.toString());
                    debugPrint("loginState after signin: " + _loginDataProvider.loginState.toString());

                    Navigator.pushNamed(context, "/home");
                  }
                } else if (_loginDataProvider.loginState == true) {
                  showResultDialog(context, "로그인 실패!", "이미 로그인 중입니다.");
                }
              },
              child: const Text("로그인"),
            ),
            const SizedBox(
              height: large_gap,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: '아직 회원이 아니신가요?',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, "/sign-up");
                      }),
              ]),
            )
          ],
        ));
  }

  void showResultDialog(BuildContext context, String title, String alertMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomAlertDialog(title: title, alertMsg: alertMsg));
  }
}

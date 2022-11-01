import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slide_to_push_frontend/api/http_service_api.dart';
import 'package:slide_to_push_frontend/api/states/sign_in_info.dart';

import 'package:slide_to_push_frontend/components/inputs/text_field_email.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_password.dart';
import 'package:slide_to_push_frontend/components/test_view.dart';

import 'package:slide_to_push_frontend/utility/buttons.dart';
import 'package:slide_to_push_frontend/utility/routes.dart';
import 'package:slide_to_push_frontend/utility/size.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  late TextEditingController emailEditController;
  late TextEditingController passwordController;

  static final storage = FlutterSecureStorage();

  String accountInfo = "";
  bool isAuthenticated = false;
  bool isSignIn = false;

  changeStatus() {
    if (isAuthenticated != false) {
      isSignIn = true;
    } else {
      isSignIn = false;
    }
  }
  saveSignInInfo() async{
    SignInAccount account = SignInAccount(
        emailEditController.text,
        passwordController.text
    );

    await HttpService().signInService(account);

    // 서버와 통신이 되면
    if(HttpService.resSignIn.statusCode == 200) {
      var resToken = HttpService.resSignIn.body;

      isAuthenticated = true;
      await storage.write(key: 'account', value: resToken.toString());
      changeStatus();

    } else {
      debugPrint(HttpService.resSignIn.body.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    emailEditController = TextEditingController();
    passwordController = TextEditingController();

    //비동기로 flutter secure storage 정보를 불러오는 작업.
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _asyncMethod();
    // });
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    accountInfo = (await storage.read(key: "account"))!;
    debugPrint(accountInfo);

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (accountInfo != null) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => TestHomeView(account: accountInfo),
        ),
      );
    } else {
      debugPrint("널체크 문제가 있다네?");
    }
  }

  @override
  void dispose() {
    emailEditController.dispose();
    passwordController.dispose();
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
            TextFieldPassword(controller: passwordController),
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
                saveSignInInfo();
                _asyncMethod();
              },
              child:Text("SIGN IN", style: TextStyle(color: Colors.white,)),
              style: Buttons.defaultButton,
            )
          ],
        )
    );
  }
}

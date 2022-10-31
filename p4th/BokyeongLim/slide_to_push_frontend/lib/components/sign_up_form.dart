import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slide_to_push_frontend/api/states/account_info.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_common.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_email.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_password.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_checked_password.dart';

import 'package:slide_to_push_frontend/utility/buttons.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/utility/routes.dart';
import 'package:slide_to_push_frontend/utility/size.dart';

import '../api/http_service_api.dart';
import '../api/spring_api.dart';
import 'inputs/checkBox_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  late TextEditingController emailEditController;
  late TextEditingController textEditController;
  late TextEditingController passwordController;

  bool isButtonActive = true;
  bool isCheckedAccountEmail = false;

  @override
  void initState() {
    super.initState();
    emailEditController = TextEditingController();
    textEditController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailEditController.dispose();
    textEditController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  checkAccountEmail(String email) async{
    await HttpService().emailValidation(email);

    if(HttpService.resEmailValidation.statusCode == 200) {
      var responseBody = jsonDecode(HttpService.resEmailValidation.body);

      if(responseBody == true) {
        isCheckedAccountEmail = true;
        setState(() {
          isButtonActive = false;
        });
      } else {
        alertNotAvailable();
        setState(() {
          isButtonActive = true;
        });
      }
    }
  }
  saveAccountInfo() async{
    Account account = Account(
        textEditController.text,
        emailEditController.text,
        passwordController.text
    );

    await HttpService().signUpService(account);

    if(HttpService.resSignUp.statusCode == 200) {
      var responseBody = jsonDecode(HttpService.resSignUp.body);
      debugPrint(responseBody.toString());

      if (responseBody == true) {
        debugPrint("가입됨");
      } else {
        alertFailedSignUp();
        textEditController.clear();
        emailEditController.clear();
        passwordController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFieldCommon(formName: '닉네임', controller: textEditController),
            SizedBox(height: medium_gap),
            TextFieldEmail(controller: emailEditController,),
            SizedBox(height: small_gap),
            ElevatedButton(
              onPressed: isButtonActive
                ? (){
                if(emailEditController.text.isNotEmpty) {
                  checkAccountEmail(emailEditController.text);
                }
                if(emailEditController.text.isEmpty) {
                  alertEnterEmail();
                  setState(() {
                    isButtonActive = true;
                  });
                }
              }
              : null,
              child: Text("이메일 중복 체크"),
              style: Buttons.subLongButton,
            ),
            SizedBox(height: medium_gap),
            TextFieldPassword(controller: passwordController),
            SizedBox(height: medium_gap),
            TextFieldCheckedPassword(),
            SizedBox(height: small_gap),
            CheckBoxField(title: '이용약관에 동의하십니까?'),
            SizedBox(height: small_gap),
            ElevatedButton(
              onPressed:(){

                //비밀번호 확인 & 동의 여부 확인 & 중복확인
                int tmp = passwordController.text.compareTo(TextFieldCheckedPassword.checkedPassword);
                if(tmp != 0) {
                  failDueToPasswordError();
                } else if (CheckBoxField.isChecked == false) {
                  failDueToUnchecked();
                } else if (isCheckedAccountEmail == false) {
                  alertEnterEmail();
                } else {
                  saveAccountInfo();
                  formKey.currentState?.save();
                  Navigator.of(context).pushNamed(Routes.signIn);
                }

              },
              child:Text("SIGN UP", style: TextStyle(color: Colors.white,)),
              style: Buttons.defaultButton,
            ),
            SizedBox(height: medium_gap),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Back', style:TextStyle(color: ColorPicker.subTextButton, fontSize: 18)),
              style: Buttons.defaultTextButton,
            )
          ],
        )
    );
  }
}



void alertFailedSignUp() {
  Fluttertoast.showToast(
    msg:"가입에 실패하였습니다.",
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void alertNotAvailable() {
  Fluttertoast.showToast(
    msg:"중복된 이메일입니다.",
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void alertEnterEmail() {
  Fluttertoast.showToast(
    msg:"이메일을 다시 확인해주세요.",
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void failDueToUnchecked() {
  Fluttertoast.showToast(
    msg:"이용약관에 동의해주세요.",
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void failDueToPasswordError() {
  Fluttertoast.showToast(
    msg:"비밀번호를 확인해주세요.",
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_SHORT,
  );
}


import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:leaing_helper/components/text_form_filed/email_text_form_field.dart';
import 'package:leaing_helper/components/text_form_filed/nickname_text_form_feild.dart';
import 'package:leaing_helper/components/text_form_filed/password_text_form_field.dart';
import 'package:leaing_helper/utility/alert/common_alert_dialog.dart';

import '../../../api/state/sign_up_validate_state.dart';
import '../../../api/info/sign_up_info.dart';
import '../../../api/spring_sign_up_api.dart';
import '../../../utility/alert/commonSnackBar.dart';
import '../../../utility/decorations/buttonStyle.dart';
import '../../../utility/decorations/text_style.dart';
import '../../../utility/size.dart';
import '../../text_form_filed/password_checked_text_form_field.dart';

class SignUpForm extends StatefulWidget{
  const SignUpForm({Key? key}) : super (key: key);

  @override
  State<SignUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SignUpForm> {
  late TextEditingController emailEditController;
  late TextEditingController passwordController;
  late TextEditingController nicknameController;
  late TextEditingController passwordCheckController;

  @override
  void initState() {
    super.initState();
    emailEditController = TextEditingController();
    passwordController = TextEditingController();
    nicknameController = TextEditingController();
    passwordCheckController = TextEditingController();
  }

  @override
  void dispose() {
    emailEditController.dispose();
    passwordController.dispose();
    nicknameController.dispose();
    passwordCheckController.dispose();
    super.dispose();
  }

  saveAccountInfo() async{ // 회원 가입 진행 부분
    SignUpAccount account = SignUpAccount(
        nicknameController.text,
        emailEditController.text,
        passwordController.text
    );

    await SpringSignUpApi().signUp(account);


      if (SignUpValidateState.isSignUpCheck == true) {
        setSignUpValidateState();
        debugPrint("가입됨");
        showDialog(
            context: context,
            builder: (BuildContext context){
              return showCusTomDialog().showSignUpDialog(context);
            });
      } else {
        nicknameController.clear();
        emailEditController.clear();
        passwordController.clear();
        setSignUpValidateState();
        ScaffoldMessenger.of(context).showSnackBar(
            CommonSnackBar.failSignUP());
      }

  }

  setSignUpValidateState(){
    SignUpValidateState.isEmailCheck = false;
    SignUpValidateState.isNicknameCheck = false;
  }

    @override
    Widget build(BuildContext context) {
      GlobalKey<FormState> formkey = GlobalKey<FormState>();
      return Form(
          key: formkey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: xlarge_gap,),
                SizedBox(
                    width: double.infinity,
                    child:
                    Text(
                      "Create a new",
                      style: welcomeTextStyleBlack(),
                      textAlign: TextAlign.left,)),
                SizedBox(
                    width: double.infinity,
                    child:
                    Text(
                      "account",
                      style: welcomeTextStyleBlack(),
                      textAlign: TextAlign.left,)),
                const SizedBox(height: large_gap),
                EmailTextFormField(widthSize: textFormWidth,
                    usedPosition: "signUp",
                    controller: emailEditController),
                const SizedBox(height: small_gap),
                NickNameTextFormField(
                  widthSize: textFormWidth, controller: nicknameController,),
                const SizedBox(height: small_gap),
                PasswordTextFormField(
                    widthSize: textFormWidth, controller: passwordController),
                const SizedBox(height: small_gap),
                PasswordCheckedTextFormField(
                  widthSize : textFormWidth,controller: passwordCheckController,),
                const SizedBox(height: large_gap),
                ElevatedButton(
                  onPressed: () {
                    // 비밀 번호 체크
                    String myPassword = passwordController.text;
                    int tmp = myPassword.compareTo(passwordCheckController.text);
                    debugPrint("myPassword : "+ myPassword
                        +"passwordCheckController.text :"+ passwordCheckController.text + "tmp : "+tmp.toString());

                    if(SignUpValidateState.isEmailCheck != true){ // 이메일 체크 확인
                      ScaffoldMessenger.of(context).showSnackBar(
                          CommonSnackBar.emailFailSnackBar());
                    }else if(SignUpValidateState.isNicknameCheck != true){ // 닉네임 체크 확인
                      ScaffoldMessenger.of(context).showSnackBar(
                          CommonSnackBar.nickNameFailSnackBar());
                    }else if(tmp != 0){ // 비밀 번호 확인 체크
                      ScaffoldMessenger.of(context).showSnackBar(
                          CommonSnackBar.passwordFailSnackBar());
                    }else{ //모두 통과 하면 회원 가입 진행
                      formkey.currentState?.save();
                      saveAccountInfo();
                    }
                  },
                  child:
                  SizedBox(
                      width: double.infinity,
                      child: Text("Register now", style: defaultBtnTextStyle(),
                        textAlign: TextAlign.center,)),
                  style: elevatedButtonStyle(
                      medium_btn_width, small_btn_height),
                ),
              ]
          )
      );
    }
  }
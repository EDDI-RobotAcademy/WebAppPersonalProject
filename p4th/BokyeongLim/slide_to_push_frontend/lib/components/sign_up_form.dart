import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slide_to_push_frontend/api/spring_api.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_common.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_email.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_password.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_checked_password.dart';

import 'package:slide_to_push_frontend/utility/buttons.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/utility/size.dart';

import 'inputs/checkBox_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  String firstPassword = TextFieldPassword.password;
  String secondPassword = TextFieldCheckedPassword.checkedPassword;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFieldCommon(formName: '닉네임'),
            SizedBox(height: medium_gap),
            TextFieldEmail(),
            SizedBox(height: small_gap),
            ElevatedButton(
              onPressed: (){} ,
              child: Text("이메일 중복 체크",style: TextStyle(color: ColorPicker.defaultBlack)),
              style: Buttons.subButton2,
            ),
            SizedBox(height: medium_gap),
            TextFieldPassword(),
            SizedBox(height: medium_gap),
            TextFieldCheckedPassword(),
            SizedBox(height: small_gap),
            CheckBoxField(title: '이용약관에 동의하십니까?'),
            SizedBox(height: small_gap),
            ElevatedButton(
              onPressed:(){
                formKey.currentState?.save();
                int tmp = compareToString(TextFieldPassword.password,TextFieldCheckedPassword.checkedPassword);

                // debugPrint(TextFieldPassword.password + " "+TextFieldCheckedPassword.checkedPassword );
                // debugPrint('$tmp');

                if(tmp != 0) {
                  failDueToPasswordError();
                } else if (CheckBoxField.isChecked == false) {
                  failDueToUnchecked();
                } else {
                  SpringApi().signUp(SignUpRequest(
                      TextFieldCommon.enteredMessage,
                      TextFieldEmail.email,
                      TextFieldPassword.password
                  ));
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

int compareToString(String msg1, String msg2){
  return msg1.compareTo(msg2);
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
import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_nickName.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_email.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_password.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_checked_password.dart';

import 'package:slide_to_push_frontend/utility/buttons.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/utility/size.dart';

import '../api/http_service_api.dart';
import 'inputs/checkBox_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  late TextEditingController emailEditController;
  bool isButtonActive = true;

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

  checkAccountEmail(String email) async{
    await HttpService().emailValidation(email);
    if(HttpService.resEmailValidation.statusCode == 200) {
      var responseBody = jsonDecode(HttpService.resEmailValidation.body);
      debugPrint(responseBody.toString());

      if(responseBody == true) {
        debugPrint("프론트로 넘어옴");
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

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFieldCommon(formName: '닉네임'),
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
                      emailEditController.text,
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

void alertNotAvailable() {
  Fluttertoast.showToast(
    msg:"중복된 이메일입니다.",
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void alertEnterEmail() {
  Fluttertoast.showToast(
    msg:"이메일을 입력해주세요.",
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
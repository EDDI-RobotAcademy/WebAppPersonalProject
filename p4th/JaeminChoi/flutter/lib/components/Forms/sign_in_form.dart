import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/buttonStyle.dart';

import '../../api/spring_sign_in_api.dart';
import '../../utility/decorations/color.dart';
import '../../utility/decorations/text_style.dart';
import '../logo.dart';
import '../text_btn_box.dart';
import '../text_form_filed/email_text_form_field.dart';
import '../text_form_filed/password_text_form_field.dart';
import '../../utility/size.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 150,),
            SizedBox(
                width: double.infinity,
                child:
                Text(
                  "Welcome to" ,
                  style: welcomeTextStyleBlack(),
                  textAlign: TextAlign.left,)),
            SizedBox(
                width: double.infinity,
                child:
                Text(
                  "LearnTable" ,
                  style: welcomeTextStyleYellow(),
                  textAlign: TextAlign.left,)),
            const SizedBox(height: xmedium_gap),
            SizedBox(
                width: double.infinity,
                child: Text("Email" , style: defaultTextFieldTextStyle(),textAlign: TextAlign.left,)),
            const EmailTextFormField(widthSize: large_container_width),
            const SizedBox(height: medium_gap),
            SizedBox(
                width: double.infinity,
                child: Text("password" , style: defaultTextFieldTextStyle(),textAlign: TextAlign.left,)),
            const PasswordTextFormField(widthSize: large_container_width),
            const SizedBox(height: large_gap),
            const SizedBox(
              width: 275,
              child: Text(
                "Forget password ?",
                style: TextStyle(color: ColorStyle.defaultButton,fontSize: 10),
                textAlign: TextAlign.right,)
            ),
            const SizedBox(height: large_gap),
            ElevatedButton(
              onPressed: (){
                formkey.currentState?.save();
                SpringSignInApi().login(UserLoginRequest(EmailTextFormField.email , PasswordTextFormField.password));
                },
              child :
              SizedBox(
                  width: double.infinity,
                  child: Text("Log in", style: defaultBtnTextStyle(), textAlign: TextAlign.center,)),
              style: elevatedButtonStyle(medium_btn_width,small_btn_height , 2),
            ),
          ],
        )
    );
  }

}
import 'package:flutter/material.dart';
import 'package:leaing_helper/components/logo.dart';
import 'package:leaing_helper/components/text_form_filed/email_text_form_field.dart';
import 'package:leaing_helper/components/text_form_filed/nickname_text_form_feild.dart';
import 'package:leaing_helper/components/text_form_filed/password_text_form_field.dart';

import '../../api/spring_sign_up_api.dart';
import '../../api/spring_validate_api.dart';
import '../../utility/decorations/buttonStyle.dart';
import '../../utility/decorations/text_style.dart';
import '../../utility/size.dart';
import '../text_btn_box.dart';

class SignUpForm extends StatefulWidget{
  const SignUpForm({Key? key}) : super (key: key);

  @override
  State<SignUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SignUpForm>{

  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70,),
            SizedBox(
                width: double.infinity,
                child:
                Text(
                  "Create a new" ,
                  style: welcomeTextStyleBlack(),
                  textAlign: TextAlign.left,)),
            SizedBox(
                width: double.infinity,
                child:
                Text(
                  "account" ,
                  style: welcomeTextStyleBlack(),
                  textAlign: TextAlign.left,)),
            const SizedBox(height: xmedium_gap),
            const EmailTextFormField(widthSize: large_container_width , usedPosition: "signUp"),
            const SizedBox(height: xmedium_gap),
            const NickNameTextFormField(widthSize: large_container_width,),
            const SizedBox(height: xmedium_gap),
            const PasswordTextFormField(widthSize: large_container_width),
            const SizedBox(height: xmedium_gap),
            ElevatedButton(
              onPressed: (){
                formkey.currentState?.save();
                SpringSignUpApi().signUp(UserSignUpRequest(EmailTextFormField.email ,NickNameTextFormField.nickName ,PasswordTextFormField.password));
              },
              child :
              SizedBox(
                  width: double.infinity,
                  child: Text("Register now", style: defaultBtnTextStyle(), textAlign: TextAlign.center,)),
              style: elevatedButtonStyle(medium_btn_width,small_btn_height , 2),
            ),
          ]
            )
       );
  }
}
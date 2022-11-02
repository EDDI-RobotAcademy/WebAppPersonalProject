import 'package:flutter/material.dart';
import 'package:leaing_helper/components/logo.dart';
import 'package:leaing_helper/components/text_form_filed/email_text_form_field.dart';
import 'package:leaing_helper/components/text_form_filed/nickname_text_form_feild.dart';
import 'package:leaing_helper/components/text_form_filed/password_text_form_field.dart';

import '../../api/spring_validate_api.dart';
import '../../utility/decorations/buttonStyle.dart';
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
        child: Container (
            alignment: Alignment.center,
            width: large_container_width,
            height: 490,
            child: Column(
              children: <Widget>[
                const Logo(title: "회원가입"),
                Row(
                  children: <Widget>[
                    const EmailTextFormField(widthSize: small_container_width),
                    const SizedBox(width: large_gap,),
                    ElevatedButton(
                      onPressed: (){
                        formkey.currentState?.save();
                        SpringValidateApi().emailValidate(EmailTextFormField.email);
                      },
                        child: const Text("이메일 확인", style: TextStyle(color: Colors.white),),
                        style: elevatedButtonStyle(),
                    )
                  ],
                ),
                const SizedBox(height: large_gap,),
                Row(
                  children: <Widget>[
                    const NickNameTextFormField(widthSize: small_container_width),
                    const SizedBox(width: large_gap,),
                    ElevatedButton(
                        onPressed: (){
                          formkey.currentState?.save();
                          SpringValidateApi().nickNameValidate(NickNameTextFormField.nickName);
                        },
                        child: const Text("닉네임 확인" ,style: TextStyle(color: Colors.white),),
                        style: elevatedButtonStyle(),
                    )
                  ],
                ),
                const SizedBox(height: large_gap,),
                const PasswordTextFormField(widthSize: large_container_width),
                const PasswordTextFormField(widthSize: large_container_width),
              ],
            )
       ),
    );
  }
}
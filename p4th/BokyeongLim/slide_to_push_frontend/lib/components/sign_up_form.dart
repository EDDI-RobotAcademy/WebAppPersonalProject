import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_nickName.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_email.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_password.dart';
import 'package:slide_to_push_frontend/components/inputs/text_field_checked_password.dart';

import 'package:slide_to_push_frontend/utility/buttons.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/utility/size.dart';



class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFieldCommon(),
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
            Row(
              children: <Widget>[
                Checkbox(
                    value: _isChecked,
                    onChanged: (value){
                      setState(() {
                        _isChecked = value!;
                      });
                    }
                ),
                SizedBox(width: small_gap),
                Text('이용약관에 동의하십니까?')
              ],
            ),
            SizedBox(height: small_gap),
            ElevatedButton(
              onPressed:(){
                if(TextFieldPassword.password == TextFieldCheckedPassword.checkedPassword){
                  formKey.currentState?.save();
                  debugPrint(TextFieldPassword.password + TextFieldCheckedPassword.checkedPassword + "체크");
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

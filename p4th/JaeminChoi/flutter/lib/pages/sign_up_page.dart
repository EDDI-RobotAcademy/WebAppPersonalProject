import 'package:flutter/material.dart';
import 'package:leaing_helper/components/text_form_filed/email_text_form_field.dart';

import '../components/Forms/sign_up_form.dart';
import '../components/text_btn_box.dart';
import '../utility/decorations/color.dart';
import '../utility/size.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body : SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 50),
          width: double.infinity,
          child: Column (
            children: <Widget> [
              const SignUpForm(),
              const SizedBox(height: 20,),
              Row(
                children: const [
                  SizedBox(
                    width: 185,
                    child:Text("Already have a account ? ", style: TextStyle(color: Colors.black , fontSize: 10), textAlign: TextAlign.right,) ,),
                  SizedBox(
                    width: 100,
                    child:Text(" sign in", style: TextStyle(color: ColorStyle.defaultButton , fontSize: 10), textAlign: TextAlign.left,) ,),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
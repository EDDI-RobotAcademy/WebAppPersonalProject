import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/components/sign_in_form.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/utility/size.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 80),
              Column(
                children:[
                  Text(
                    'SIGN - IN',
                    style: TextStyle(
                      fontFamily: 'AppleSDGothicNeoH',
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: ColorPicker.defaultBlack,
                    ),
                  ),
                  SizedBox(height: large_gap,),
                ],
              ),
              SignInForm(),
            ],
          )
        ),
      ),
    );
  }
}

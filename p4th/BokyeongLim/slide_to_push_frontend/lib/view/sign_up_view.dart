import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/components/sign_up_form.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/utility/size.dart';


class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              // decoration: defaultContainerLine(),
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(height: large_gap),
                  Container(

                    child: Column(
                      children:[
                        Text(
                          'SIGN - UP',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeoH',
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            color: ColorPicker.defaultBlack,
                          ),
                        ),
                        SizedBox(height: large_gap),
                        SignUpForm(),
                      ],
                    )
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

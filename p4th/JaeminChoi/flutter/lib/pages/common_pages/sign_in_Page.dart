import 'package:flutter/material.dart';
import 'package:leaing_helper/components/Forms/personal_form/sign_in_form.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.only(left: 50),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  const SignInForm(),
                  const SizedBox(height: 30,),
                  Row(
                    children: const [
                      SizedBox(
                        width: 150,
                        child:Text("Not a member ? ", style: TextStyle(color: Colors.black , fontSize: 10), textAlign: TextAlign.right,) ,),
                      SizedBox(
                        width: 150,
                        child:Text(" join now", style: TextStyle(color: ColorStyle.focusedTextForm , fontSize: 10), textAlign: TextAlign.left,) ,),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
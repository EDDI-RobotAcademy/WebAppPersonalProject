import 'package:flutter/material.dart';
import 'package:look_style/components/sign_in_email_text_form_field.dart';
import 'package:look_style/components/sign_in_form_field.dart';
import 'package:look_style/components/route_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Look Style", style: TextStyle(color: Colors.black),),
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.white
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/logo.png' ,width: 300, height: 300,),
                // Text("Look Style", style: TextStyle(fontSize: 40, fontFamily: "bazzi")),
                SignInFormField(),
                Divider(height: 40, thickness: 1, indent: 30, endIndent: 30,),
                RouteButton(name: "회원가입", route: "/sign-up", width: 250, height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

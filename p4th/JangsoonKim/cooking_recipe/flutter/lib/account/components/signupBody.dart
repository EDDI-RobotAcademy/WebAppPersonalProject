import 'package:demo/account/components/background.dart';
import 'package:demo/account/components/rounded_id_field.dart';
import 'package:demo/account/components/rounded_nicknamce_field.dart';
import 'package:demo/account/components/rounded_password_field.dart';
import 'package:demo/account/login_screen.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_button.dart';

class SignupBody extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Background(
          child: SingleChildScrollView(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "아이디",
                style: TextStyle(color: Colors.grey[700]),
              ),
              RoundedIdField(
                hinText: "이메일 아이디",
                onChanged: (value) {},
              ),
            ]),
            SizedBox(
              height: size.height * 0.03,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                " 비밀번호",
                style: TextStyle(color: Colors.grey[700]),
              ),
              RoundedPasswordField(
                onChanged: (value) {},
                hinText: "비밀번호",
              ),
            ]),
            SizedBox(
              height: size.height * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' 닉네임', style: TextStyle(
                  color: Colors.grey[700]
                ),),
                RoundedNicknameField(hinText: "3~10자 사이, 한글, 영문", onChanged: (value) {}),
              ],
            ),
            RoundedButton(
              text: "회원가입",
              onPressed: () {
                if  (_formKey.currentState!.validate()){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return LoginScreen();
                      })
                  );
                }
              },
              color: Colors.orange,
              textColor: Colors.white,
            ),
        ],
      ),
          )),
    );
  }
}

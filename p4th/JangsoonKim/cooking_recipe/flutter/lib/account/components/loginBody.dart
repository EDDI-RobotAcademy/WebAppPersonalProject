
import 'package:demo/account/components/background.dart';
import 'package:demo/account/components/sns_icon.dart';
import 'package:demo/account/components/social_login_divider.dart';
import 'package:demo/components/rounded_button.dart';
import 'package:demo/account/components/rounded_password_field.dart';
import 'package:demo/account/signup_screen.dart';
import 'package:demo/account/components/rounded_id_field.dart';
import 'package:demo/home_screen.dart';
import 'package:flutter/material.dart';

import '../../api/spring_api.dart';

class LoginBody extends StatefulWidget {


  LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => LoginBodyState();
}

class LoginBodyState extends State<LoginBody> {
  String email = '';
  String nickname = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
            const Text(
              "로그인",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Image.asset(
              "assets/images/signin/signin_screen3.png",
              height: size.height * 0.3,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedIdField(
              hinText: "이메일 아이디",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              hinText: "비밀번호",
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedButton(
              text: "로그인",
              onPressed: () {
                if  (_formKey.currentState!.validate()){
                  SpringApi().login(UserLoginRequest(email, password));
                  UserLoginResponse? response;
                  print(response?.success);

                  if(response?.success == true){

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return HomeScreen();
                    })
                  );}
                }
              },
              color: Colors.orange,
              textColor: Colors.white,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "아직 회원이 아니신가요 ? ",
                  style: TextStyle(color: Colors.black54),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SignupScreen();
                    }));
                  },
                  child: const Text(
                    "이메일 회원가입",
                    style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            SocialLoginDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SnsIcon(
                  iconSrc: "assets/icons/sns/naver_login_btn1.png",
                  press: () {},
                ),
                SnsIcon(
                  iconSrc: "assets/icons/sns/apple_login_btn1.png",
                  press: () {},
                )
              ],
            ),
      ],
    ),]
          ),
        ));
  }
}






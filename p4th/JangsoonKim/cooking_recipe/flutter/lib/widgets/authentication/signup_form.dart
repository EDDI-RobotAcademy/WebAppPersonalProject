import 'package:demo/screens/login_screen.dart';
import 'package:demo/utilities/spring_api.dart';
import 'package:demo/widgets/authentication/background.dart';
import 'package:demo/widgets/authentication/rounded_id_field.dart';
import 'package:demo/widgets/authentication/rounded_nickname_field.dart';
import 'package:demo/widgets/authentication/rounded_password_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/rounded_button.dart';

class SignupForm extends StatefulWidget {

  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  String email = '';
  String nickname = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();


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
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                onPressed: () {
                  _formKey.currentState?.save();
                  Future<bool?> future = SpringApi().emailDuplicate(email);
                  print(bool);
                  future.then((bool) {
                    print("사용가능한 이메일");
                  }).catchError((error) {
                    print("사용불가 이메일");
                    //임시
                  });
                },
                child: const Text(
                  "이메일 중복 확인",
                  style: TextStyle(color: Colors.white, backgroundColor: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
                Text(
                  ' 닉네임',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                RoundedNicknameField(
                    hinText: "3~10자 사이, 한글, 영문", onChanged: (value) {}),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange
                ),
                onPressed: () {
                  _formKey.currentState?.save();
                  Future<bool?> future = SpringApi().nicknameDuplicate(nickname);
                  future.then((bool) {
                    print("사용가능한 닉네임");
                  }).catchError((error) {
                    print("사용불가한 닉네임");
                    //임시
                  });
                },
                child: const Text(
                  "닉네임 중복 확인",
                  style: TextStyle(color: Colors.white, backgroundColor: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedButton(
              text: "회원가입",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  SpringApi().signUp(UserSignUpRequest(email, password, nickname));
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
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

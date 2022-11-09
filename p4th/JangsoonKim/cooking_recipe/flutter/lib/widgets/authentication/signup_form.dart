import 'package:demo/screens/login_screen.dart';
import 'package:demo/utilities/spring_api.dart';
import 'package:demo/widgets/authentication/background.dart';
import 'package:demo/widgets/authentication/rounded_id_field.dart';
import 'package:demo/widgets/authentication/rounded_nickname_field.dart';
import 'package:demo/widgets/authentication/rounded_password_field.dart';
import 'package:flutter/cupertino.dart';
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  _formKey.currentState?.save();
                  bool emailValid = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(email);
                  if (emailValid == false) {
                    _showDialog(title: '아이디', content: '이메일 형식의 아이디를 입력해주세요.');
                  } else {
                    Future<bool?> future = SpringApi().emailDuplicate(email);
                    future.then((bool) {
                      _showDialog(title: '아이디', content: '사용 가능한 아이디 입니다.');
                      print("사용가능한 이메일");
                    }).catchError((error) {
                      print("사용불가 이메일");
                      _showDialog(title: '아이디', content: '이미 사용 중인 아이디 입니다.');
                    });
                  }
                },
                child: const Text(
                  "이메일 중복 확인",
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.orange,
                      fontWeight: FontWeight.bold),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  _formKey.currentState?.save();
                  bool nicknameValid = RegExp(r"^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{3,10}$")
                      .hasMatch(nickname);
                  if (nicknameValid == false) {
                    _showDialog(
                        title: '닉네임', content: '형식에 맞지 않는 닉네임입니다. 다시 입력해 주세요.');
                  } else {
                    Future<bool?> future =
                        SpringApi().nicknameDuplicate(nickname);
                    future.then((bool) {
                      _showDialog(title: '닉네임', content: '사용가능한 닉네임입니다.');
                      print("사용가능한 닉네임");
                    }).catchError((error) {
                      _showDialog(title: '닉네임', content: '이미 사용 중인 닉네임입니다.');
                      print("사용불가한 닉네임");
                      //임시
                    });
                  }
                },
                child: const Text(
                  "닉네임 중복 확인",
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "회원가입",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  SpringApi()
                      .signUp(UserSignUpRequest(email, password, nickname));
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

  void _showDialog({String? title, String? content}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(content!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}

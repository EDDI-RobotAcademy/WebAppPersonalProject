import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/api/authentication/spring_nickname_validation_api.dart';
import 'package:lol_esports_korea_app/components/authentication/member.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_in_page.dart';

import '../../api/authentication/globals_success_check.dart';
import '../../api/authentication/spring_email_validation_api.dart';
import '../../api/authentication/spring_sign_up_api.dart';
import '../../components/authentication/accept/accept_box.dart';
import '../../utility/common_alert_dialog.dart';
import '../../utility/size.dart';
import '../../components/app_bar/common_top_app_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Member member = Member("", "", "", 0);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          CommonTopAppBar(title: const Text('MEMBER JOIN'), appBar: AppBar()),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 610,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xff23124b),
                    borderRadius: BorderRadius.only(
                        //둥글게 만들기
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.red,
                            ),
                            const SizedBox(width: small_gap),
                            const Text(
                              "E-mail",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 58),
                            Flexible(
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: member.email),
                                onChanged: (val) {
                                  member.email = val;
                                },
                                validator: (value) {
                                  value!.isEmpty ? "E-mail is Empty" : null;
                                  if (!RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
                                          r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
                                          r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value)) {
                                    return '잘못된 이메일 형식입니다.';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Please enter E-mail",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.red,
                            ),
                            const SizedBox(width: medium_gap),
                            const Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: large_gap),
                            Flexible(
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (value) =>
                                    value!.isEmpty ? "Password is Empty" : null,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Please enter Password",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const SizedBox(width: 140),
                            Flexible(
                              child: TextFormField(
                                controller: TextEditingController(
                                    text: member.password),
                                onChanged: (val) {
                                  member.password = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is Empty";
                                  } else if (value !=
                                      _passwordController.text) {
                                    return "패스워드가 일치하지 않습니다";
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Check for Password",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.red,
                            ),
                            const SizedBox(width: medium_gap),
                            const Text(
                              "Nickname",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: large_gap),
                            Flexible(
                              child: TextFormField(
                                controller: TextEditingController(
                                    text: member.nickname),
                                onChanged: (val) {
                                  member.nickname = val;
                                },
                                validator: (value) =>
                                    value!.isEmpty ? "Nickname is Empty" : null,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Please enter Nickname",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.check_circle,
                            size: 15,
                            color: Colors.red,
                          ),
                          SizedBox(width: medium_gap),
                          Text(
                            "필수항목",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const AcceptCheck(),
                      const Expanded(child: SizedBox(height: medium_gap)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //E-mail 중복 검사 실행
                        SpringEmailValidationApi()
                            .emailValidation(member.email);
                        if (GlobalsSuccessCheck.isEmailCheck) {
                          // 닉네임 중복 검사 실행
                          SpringNicknameValidationApi()
                              .nicknameValidation(member.nickname);
                          if (GlobalsSuccessCheck.isNicknameCheck) {
                            SpringSignUpApi().signUp(MemberSignUpRequest(
                                member.email,
                                member.password,
                                member.nickname));

                            // 회원가입 완료 후 로그인 페이지로 이동
                            if (GlobalsSuccessCheck.isSignUpCheck) {
                              _signUpSuccessShowDialog();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInPage()));
                            }
                          } else {
                            _nicknameOverlapShowDialog();
                          }
                        } else {
                          _emailOverlapShowDialog();
                        }
                      }
                    },
                    child: const Text(
                      "JOIN",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  /// 이메일 중복 alertDialog
  void _emailOverlapShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            title: "⚠️",
            content: '중복된 이메일입니다.',
            onCustomButtonPressed: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  /// 닉네임 중복 alertDialog
  void _nicknameOverlapShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            title: "⚠️",
            content: '중복된 닉네임입니다.',
            onCustomButtonPressed: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  /// 회원 가입 축하 alertDialog
  void _signUpSuccessShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            title: "🎉",
            content: '가입을 축하합니다!🥰 \n 로그인 화면으로 이동합니다.',
            onCustomButtonPressed: () {
              Navigator.of(context).pop();
            },
          );
        });
  }
}

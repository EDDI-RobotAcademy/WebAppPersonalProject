import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lol_esports_korea_app/api/authentication/globals_success_check.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_out_page.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_up_page.dart';
import 'package:lol_esports_korea_app/pages/home_page.dart';

import '../../api/authentication/spring_sign_in_api.dart';
import '../../utility/common_alert_dialog.dart';
import '../../utility/size.dart';
import '../../components/app_bar/common_top_app_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  static const storage = FlutterSecureStorage();
  dynamic memberInfo = '';

  @override
  void initState() {
    super.initState();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    memberInfo = await storage.read(key: 'signIn');

    //member 정보가 있을 시 이동할 페이지
    if (memberInfo != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      debugPrint('로그인이 필요합니다');
    }
  }

  // 로그인 버튼 누르면 실행
  signInAction() async {
    MemberSignInRequest memberSignInRequest =
        MemberSignInRequest(emailController.text, passwordController.text);

    await SpringHttpApi().signInApi(memberSignInRequest);

    if (SpringHttpApi.signInResponse.statusCode == 200) {
      var val = SpringHttpApi.signInResponse.body;

      await storage.write(
        key: 'signIn',
        value: val.toString(),
      );
      _signInSuccessShowDialog();
      debugPrint('접속 성공!');
    } else {
      _signInFailShowDialog();
      debugPrint('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          CommonTopAppBar(title: const Text('MEMBER LOGIN'), appBar: AppBar()),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 500,
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
                      const SizedBox(height: large_gap),
                      const Icon(
                        Icons.account_circle,
                        size: 150,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(height: medium_gap),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "E-mail",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                          controller: emailController,
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
                          decoration: const InputDecoration(
                              hintText: "Please enter E-mail",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none))),
                      Container(
                        height: 3.0,
                        color: Colors.white,
                      ),
                      const SizedBox(height: large_gap),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                          controller: passwordController,
                          validator: (value) =>
                              value!.isEmpty ? "password is Empty" : null,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Please enter Password",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none))),
                      Container(
                        height: 3.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //로그인 맵핑 요청
                        signInAction();
                        _asyncMethod();
                      }
                    },
                    child: const Text(
                      "LogIn",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  )),
              const SizedBox(height: 40),
              const Center(
                  child: Text(
                "Not a member?",
                style: TextStyle(fontSize: 15),
              )),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: const Text("Create account",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 로그인 실패 alertDialog
  void _signInFailShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            title: "⚠️",
            content: '이메일 혹은 패스워드가 잘 못되었습니다.',
            onCustomButtonPressed: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  /// 로그인 성공 alertDialog
  void _signInSuccessShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
              title: "🎉️",
              content: '환영합니다🥰 \n 홈으로 이동합니다.',
              onCustomButtonPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage()));
              });
        });
  }
}

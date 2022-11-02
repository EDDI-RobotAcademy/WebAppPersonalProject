import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/components/authentication/user.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_in_page.dart';

import '../../components/authentication/accept/accept_box.dart';
import '../../utility/size.dart';
import '../../components/app_bar/common_top_app_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "", "");

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
                height: 580,
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
                                    TextEditingController(text: user.email),
                                onChanged: (val) {
                                  user.email = val;
                                },
                                validator: (value) =>
                                    value!.isEmpty ? "E-mail is Empty" : null,
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
                                controller:
                                    TextEditingController(text: user.password),
                                onChanged: (val) {
                                  user.password = val;
                                },
                                validator: (value) =>
                                    value!.isEmpty ? "Password is Empty" : null,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                                controller:
                                    TextEditingController(text: user.nickname),
                                onChanged: (val) {
                                  user.nickname = val;
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
              const SizedBox(height: 30),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // -> Spring Api
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      } else {
                        return;
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
}

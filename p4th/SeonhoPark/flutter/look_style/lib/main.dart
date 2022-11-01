import 'package:flutter/material.dart';
import 'package:look_style/pages/home_page.dart';
import 'package:look_style/pages/login_page.dart';
import 'package:look_style/pages/non-login_page.dart';
import 'package:look_style/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Look Style',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'jua',
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: NonLoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/sign_up": (context) => SignUpPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}

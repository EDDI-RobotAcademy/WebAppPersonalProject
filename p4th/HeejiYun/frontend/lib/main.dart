import 'package:flutter/material.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/sign_in_page.dart';
import 'package:frontend/pages/sign_up_complete_page.dart';
import 'package:frontend/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
        backgroundColor: Colors.cyanAccent.shade200,
        primary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: Size(300, 45),
      ))),
      title: 'HOME ALONE',
      initialRoute: "/sign-up-complete",
      routes: {
        "/sign-up": (context) => SignUpPage(),
        "/home": (context) => HomePage(),
        "/sign-in": (context) => SignInPage(),
        "/sign-up-complete": (context) =>SignUpCompletePage(),
      },
    );
  }
}

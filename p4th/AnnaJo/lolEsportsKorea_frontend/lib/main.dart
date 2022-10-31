import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_in_page.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_up_page.dart';
import 'package:lol_esports_korea_app/pages/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
      initialRoute: "/signIn",
      routes: {
        "/home": (context) => const HomePage(),
        "/signIn": (context) => const SignInPage(),
        "/signUp": (context) => const SignUpPage(),
      },
    );
  }
}

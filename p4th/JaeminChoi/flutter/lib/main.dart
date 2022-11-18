import 'package:flutter/material.dart';
import 'package:leaing_helper/pages/main_page.dart';
import 'package:leaing_helper/pages/sign_in_Page.dart';
import 'package:leaing_helper/pages/sign_up_page.dart';
import 'package:leaing_helper/pages/splash_screen_page.dart';
import 'package:leaing_helper/utility/decorations/color.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leaning_helper',
      theme: ThemeData(
        fontFamily: "Cafe24Ohsquareair",
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme : TextButtonThemeData(
            style: TextButton.styleFrom(
              elevation : 5,
              backgroundColor: ColorStyle.defaultButton,
              primary: Colors.white,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              minimumSize: const Size(300, 45),
            )
        ),

      ),

      initialRoute: "/splash_page",
      routes: {
        "/splash_page": (context) => const SplashScreenPage(),
        "/main_page": (context) => const MainPage(),
        "/sign_in_page" : (context) => const SignInPage(),
        "/sign_up_page" : (context) => const SignUpPage(),
      },
    );


  }
}



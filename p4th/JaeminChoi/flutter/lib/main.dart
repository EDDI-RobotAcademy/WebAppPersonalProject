import 'package:flutter/material.dart';
import 'package:leaing_helper/pages/main_manu.dart';
import 'package:leaing_helper/pages/sign_in.dart';
import 'package:leaing_helper/utility/color.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Leaning_helper',
      theme: ThemeData(
        scaffoldBackgroundColor: colorStyle.defaultBackground,
        textButtonTheme : TextButtonThemeData(
            style: TextButton.styleFrom(
              elevation : 5,
              backgroundColor: colorStyle.defaultButton,
              primary: Colors.white,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(300, 45),
            )
        ),

      ),

      initialRoute: "/main_manu",
      routes: {
        "/main_manu": (context) => MainManu(),
        "/sign_in" : (context) => SignIn(),
      },
    );


  }
}



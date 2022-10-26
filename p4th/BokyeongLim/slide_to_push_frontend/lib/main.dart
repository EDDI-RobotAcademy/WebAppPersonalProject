import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/pages/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Slide to Push',
        theme: ThemeData(
          fontFamily: 'AppleSDGothicNeo',
          scaffoldBackgroundColor: Style.defaultBackground,
        ),

        initialRoute: "/sign_in",
        routes: {
          "/sign_in": (context) => SignIn()
        },
    );


  }
}



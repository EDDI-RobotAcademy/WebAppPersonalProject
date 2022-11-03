import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import 'package:slide_to_push_frontend/utility/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Slide to Push',
      routes: Routes.routes,
      theme: ThemeData(
        fontFamily: 'AppleSDGothicNeo',
        scaffoldBackgroundColor: ColorPicker.defaultBackground,
      ),

      initialRoute: "/todos-main",

    );


  }
}



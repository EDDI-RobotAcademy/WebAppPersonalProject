import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/sign_in_view.dart';


void main() {
  runApp(GetMaterialApp(home: SignInView()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInView(),
    );
  }
}

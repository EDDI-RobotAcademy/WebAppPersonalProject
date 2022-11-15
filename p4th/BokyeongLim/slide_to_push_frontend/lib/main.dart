import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/sign_up_last_form.dart';
import 'view/sign_in_view.dart';




void main() {
  runApp(GetMaterialApp(home: SignUpLastForm()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpLastForm(),
    );
  }
}

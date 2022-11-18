import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/pages/main_page.dart';
import 'package:look_style/pages/sign_in_page.dart';
import 'package:look_style/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        title: 'Look Style',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        ),
        home: SignInPage(),
        getPages: [
          GetPage(name: '/main', page: () => MainPage()),
          GetPage(name: '/sign-up', page: () => SignUpPage()),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

import 'main_page.dart';

class SplashScreenPage extends StatefulWidget{
  const SplashScreenPage({Key? key}) : super(key :key);


  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>{

  @override
  void initState(){
    super.initState();
    Timer( const Duration(seconds: 3), (){
      moveToMain();
    });
  }
  void moveToMain() {
    setState(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorStyle.defaultBlack,
        child: const Center(child: Image(image: AssetImage("assets/images/splashLogo.png"),))
      ),
    );
  }
}
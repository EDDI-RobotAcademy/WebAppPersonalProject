import 'package:flutter/material.dart';

AppBar customAppbar(String text){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    foregroundColor: Colors.black,
    title: Text(text),
    centerTitle: false,
  );
}
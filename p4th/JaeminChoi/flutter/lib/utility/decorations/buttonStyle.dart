import 'package:flutter/material.dart';

import 'color.dart';

ButtonStyle elevatedButtonStyle(){

  return ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(50,25)),
    elevation: MaterialStateProperty.all(5.0),
    shape:MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    backgroundColor: MaterialStateProperty.resolveWith(materialStateColor),
    padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
    overlayColor: MaterialStateProperty.all(Colors.black),
  );


}
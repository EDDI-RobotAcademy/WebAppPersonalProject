import 'package:flutter/material.dart';

import 'color.dart';

ButtonStyle elevatedButtonStyle(double width,double height){

  return ButtonStyle(
    fixedSize: MaterialStateProperty.all(Size(width,height)),
    elevation: MaterialStateProperty.all(5.0),
    shape:MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    backgroundColor: MaterialStateProperty.resolveWith(materialStateColor),
    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 15.0)),
    overlayColor: MaterialStateProperty.all(ColorStyle.defaultBlack),
    alignment: Alignment.centerLeft
  );
}
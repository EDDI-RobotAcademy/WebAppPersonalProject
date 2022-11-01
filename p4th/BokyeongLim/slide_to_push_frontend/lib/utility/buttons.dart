


import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/color.dart';

class Buttons {
  Buttons._();

  static ButtonStyle get defaultButton => ElevatedButton.styleFrom(
    elevation: 0.0,
    shadowColor: Colors.transparent,
    textStyle: TextStyle(
      fontFamily: 'AppleSDGothicNeoH',
      fontWeight: FontWeight.w800,
      fontSize: 15,
      color: Colors.white,
    ),

    primary: ColorPicker.defaultBlack,
    onPrimary: Colors.black,
    shape: ContinuousRectangleBorder(),
    minimumSize: Size(400, 60),
  );

  static ButtonStyle get defaultTextButton => TextButton.styleFrom(
    textStyle: TextStyle(
      fontFamily: 'AppleSDGothicNeoB',
      fontWeight: FontWeight.w500,
    ),
  );

  static ButtonStyle get subLongButton => ElevatedButton.styleFrom(
    elevation: 0.0,
    shadowColor: Colors.transparent,
    textStyle: TextStyle(
      fontFamily: 'AppleSDGothicNeoM',
      fontWeight: FontWeight.w400,
    ),
    shape: ContinuousRectangleBorder(),
    primary: ColorPicker.subBackground,
    onPrimary:  ColorPicker.defaultBlack,
    side: BorderSide(width: 1.0, color: ColorPicker.subTextButton),
    minimumSize: Size(400, 40),
  );
}


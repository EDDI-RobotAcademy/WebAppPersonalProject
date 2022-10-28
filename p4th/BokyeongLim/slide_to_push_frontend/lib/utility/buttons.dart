


import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/color.dart';

class Buttons {
  Buttons._();

  static ButtonStyle get defaultButton => ElevatedButton.styleFrom(
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
  static ButtonStyle get defaultButtonH => ElevatedButton.styleFrom(
    textStyle: TextStyle(
      fontFamily: 'AppleSDGothicNeoH',
      fontWeight: FontWeight.w800,
      fontSize: 15,
      color: Colors.white,
    ),
    primary: ColorPicker.defaultBlack,
    onPrimary: Colors.black,
    shape: ContinuousRectangleBorder(),
    minimumSize: Size(160, 60),
  );

  static ButtonStyle get subButton => ElevatedButton.styleFrom(
    textStyle: TextStyle(
      fontFamily: 'AppleSDGothicNeoH',
      fontWeight: FontWeight.w800,
      fontSize: 15,
    ),
    primary: ColorPicker.subBackground,
    onPrimary: Colors.black,
    shape: ContinuousRectangleBorder(),
    minimumSize: Size(120, 60),
  );

  static ButtonStyle get defaultTextButton => TextButton.styleFrom(
    textStyle: TextStyle(
      fontFamily: 'AppleSDGothicNeoB',
      fontWeight: FontWeight.w500,
    ),
  );

  static ButtonStyle get subButton2 => ElevatedButton.styleFrom(
    textStyle: TextStyle(
      fontFamily: 'AppleSDGothicNeoM',
      fontWeight: FontWeight.w400,
    ),
    shape: ContinuousRectangleBorder(),
    primary: ColorPicker.subBackground,
    onPrimary: Colors.black,
    side: BorderSide(width: 1.0, color: ColorPicker.subTextButton),
    minimumSize: Size(400, 40),
  );
}


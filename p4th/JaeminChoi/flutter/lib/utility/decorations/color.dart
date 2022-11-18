import 'package:flutter/material.dart';

class ColorStyle {
  static const defaultBlack = Color(0xff000000);
  static const defaultBackground = Color(0xffD7D7D9);
  static const gray = Color(0xffC9C9C9);
  static const textGray = Color(0xffCBCBCC);
  static const textFormGray = Color(0xffF9F9F9);
  static const lineGray = Color(0xffF7F7F7);

  static const focusedTextForm = Color(0xffFEC92D);
  static const errorTextForm = Color(0xfff44336);

  static const defaultButton = Color(0xffFEC92D);
  static const buttonColor = Color(0xffA2E5DF);

}

Color materialStateColor(Set <MaterialState> states){
  const Set<MaterialState> pressedStates = <MaterialState>{
    MaterialState.pressed,
  };
  const Set<MaterialState> hoveredStates = <MaterialState>{
    MaterialState.hovered,
  };
  const Set<MaterialState> focusedStates = <MaterialState>{
    MaterialState.focused,
  };
  if (states.any(pressedStates.contains)) {
    return ColorStyle.buttonColor;
  }else if(states.any(hoveredStates.contains)){
    return ColorStyle.errorTextForm;
  }else if(states.any(focusedStates.contains)){
    return ColorStyle.focusedTextForm;
  }
  return ColorStyle.defaultBlack;
}
import 'package:flutter/material.dart';

class ColorStyle {
  static const mainBlack = Color(0xff292A30);
  static const defaultBackground = Color(0xffF5FADD);

  static const defaultButton = Color(0xffE8ECD1);

  static const strongBlue= Color(0xff2615BC);
  static const darkNavy= Color(0xff485E6C);
  static const strongPink = Color(0xffffb99f);
  static const weakPink = Color(0xfffddfcc);
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
    return Colors.blue;
  }else if(states.any(hoveredStates.contains)){
    return Colors.pink;
  }else if(states.any(focusedStates.contains)){
    return ColorStyle.strongBlue;
  }
  return ColorStyle.mainBlack;
}
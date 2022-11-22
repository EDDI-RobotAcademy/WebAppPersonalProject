import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

TextStyle defaultBtnTextStyle(){
  return const TextStyle(
    color: Colors.white,
    fontFamily: 'Cafe24Ohsquareair',
    fontSize: 12,
    fontWeight: FontWeight.bold
  );
}

TextStyle defaultTextFieldTextStyle(){
  return const TextStyle(
    color: ColorStyle.textGray,
    fontFamily: 'Cafe24Ohsquareair',
    fontSize: 12,
    fontWeight: FontWeight.bold
  );
}

TextStyle defaultTextStyle(){
  return const TextStyle(
      color: ColorStyle.defaultBlack,
      fontFamily: 'Cafe24Ohsquareair',
      fontSize: 12,
      fontWeight: FontWeight.bold
  );
}

TextStyle welcomeTextStyleBlack(){
  return const TextStyle(
    color: Colors.black,
    fontFamily: 'Cafe24Danjunghae',
    fontSize: 35,
    fontWeight: FontWeight.bold
  );
}

TextStyle welcomeTextStyleBlackInPersonalPage(){
  return const TextStyle(
      color: Colors.black,
      fontFamily: 'Cafe24Danjunghae',
      fontSize: 30,
  );
}

TextStyle welcomeTextStyleYellow(){
  return const TextStyle(
    color: ColorStyle.focusedTextForm,
    fontFamily: 'Cafe24Danjunghae',
    fontSize: 35,
    fontWeight: FontWeight.bold
  );
}
import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/color.dart';

BoxDecoration defaultContainerLine() {
  return BoxDecoration(
      border: Border(
        left: BorderSide(
            color:ColorPicker.defaultBlack,
            width: 6.0,
            style: BorderStyle.solid
        ),
        right:BorderSide(
            color:ColorPicker.defaultBlack,
            width: 6.0,
            style: BorderStyle.solid
        ),
        top:BorderSide(
            color:ColorPicker.defaultBlack,
            width: 6.0,
            style: BorderStyle.solid
        ),
      )
  );
}



InputDecoration textFormDecoration(hintText) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),

    enabledBorder:
    OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 4.0,
        borderSide: BorderSide(width: 4, color: ColorPicker.defaultBlack)
    ),
    focusedBorder:
    OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 4.0,
        borderSide: BorderSide(width: 4, color: ColorPicker.defaultBlack)
    ),
    errorBorder:
    OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 4.0,
        borderSide: BorderSide(width: 4, color: ColorPicker.errorRed)
    ),
    focusedErrorBorder:
    OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        gapPadding: 4.0,
        borderSide: BorderSide(width: 4, color: ColorPicker.errorRed)
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/color.dart';
import 'package:leaing_helper/utility/decorations/text_style.dart';

InputDecoration textFormDecoration(String hintText) {
  return InputDecoration(
    filled: true,
    fillColor: ColorStyle.textFormGray,
    hintStyle : defaultTextFieldTextStyle(),
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    enabledBorder:
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.lineGray, width: 2.0)
    ),
    focusedBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.focusedTextForm, width: 2.0)),
    errorBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.errorTextForm , width: 2.0)),
    focusedErrorBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.focusedTextForm, width: 2.0)),
    );
}


InputDecoration textFormDecorationForAdmin(String hintText) {
  return InputDecoration(
    filled: true,
    fillColor: ColorStyle.textFormGray,
    hintStyle : defaultTextFieldTextStyle(),
    hintText: hintText,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    enabledBorder:
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.lineGray, width: 2.0)
    ),
    focusedBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.focusedTextForm, width: 2.0)),
    errorBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.errorTextForm , width: 2.0)),
    focusedErrorBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorStyle.focusedTextForm, width: 2.0)),
  );
}
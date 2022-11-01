import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/color.dart';

InputDecoration textFormDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
    enabledBorder:
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: colorStyle.mainBlack, width: 1.0)
    ),
    focusedBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: colorStyle.strongBlue, width: 1.0)),
    errorBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.red , width: 1.0)),
    focusedErrorBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: colorStyle.strongBlue, width: 1.0)),
    );
}
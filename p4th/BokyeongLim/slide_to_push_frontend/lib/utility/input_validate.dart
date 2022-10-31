
import 'package:flutter/material.dart';

class CheckValidate {
  String? validateText(FocusNode focusNode, String value) {
    if(value.isEmpty) {
      focusNode.requestFocus();
      return '필수 사항입니다.';
    } else {
      return null;
    }
  }
  String? validateEmail(FocusNode focusNode, String value) {
    if(value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요';
    } else if(!value.isValidEmailFormat()) {
      focusNode.requestFocus();
      return '유효하지 않은 이메일 형식입니다.';
    } else {
      return null;
    }
  }
  String? validatePassword(FocusNode focusNode, String value) {
    if(!value.isValidPasswordFormat()) {
      focusNode.requestFocus();
      return '유효하지 않은 비밀번호입니다.';
    } else {
      return null;
    }
  }
}


extension InputValidate on String {

  // 비밀번호 포맷 검증
  bool isValidPasswordFormat() {
    return RegExp(
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,20}$")
        .hasMatch(this);
  }
  //이메일 포맷 검증
  bool isValidEmailFormat() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  //대쉬를 포함하는 010 휴대폰 번호 포맷 검증 (010-1234-5678)
  bool isValidPhoneNumberFormat() {
    return RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(this);
  }
}
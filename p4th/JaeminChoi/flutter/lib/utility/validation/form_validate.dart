import 'package:flutter/material.dart';

import '../../api/state/sign_in_validate_state.dart';
import '../../api/state/sign_up_validate_state.dart';
import '../../api/spring_validate_api.dart';


class CheckValidate {
  String? validateEmail(FocusNode focusNode, String value) {
    if(value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요';
    } else if(!value.isValidEmail()) {
      focusNode.requestFocus();
      return '유효하지 않은 이메일 형식입니다.';
    } else {
      SignInValidateState.isEmailCheck = true;
      return null;
    }
  }



  String? validateEmailForSignUp(FocusNode focusNode, String value) {
    if(value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요';
    } else if(!value.isValidEmail()) {
      focusNode.requestFocus();
      return '유효하지 않은 이메일 형식입니다.';
    } else {
      SpringValidateApi().emailValidate(value);
      return null;
    }
  }

  String? validatePassword(FocusNode focusNode, String value) {
    if(value.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요';
    } else if(!value.isValidPassword()) {
      focusNode.requestFocus();
      return '유효하지 않은 비밀번호입니다.';
    } else {
      SignInValidateState.isPasswordCheck = true;
      return null;
    }
  }

  String? validateNickName(FocusNode focusNode, String value) {
    if(value.isEmpty) {
      focusNode.requestFocus();
      return '닉네임을 입력하세요';
    } else if(!value.isValidNickName()) {
      focusNode.requestFocus();
      return '해당 닉네임은 사용 할 수 없습니다.';
    } else {
      SpringValidateApi().nickNameValidate(value);
        return null;
    }
  }

}


extension InputValidate on String {

  //이메일 양식
  bool isValidEmail() {
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return emailRegExp.hasMatch(this);
  }

  // 비밀번호 양식 소문자 + 숫자 + 특수문자 + 최소 6자리 이상
  bool isValidPassword() {
    final passwordRegExp = RegExp(
        r"^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$");

    return passwordRegExp.hasMatch(this);
  }

  // 비밀번호 양식 영어,한국어,숫자 2자리 ~ 10 자리
  bool isValidNickName() {
    final passwordRegExp = RegExp(
        r"^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$");

    return passwordRegExp.hasMatch(this);
  }
}
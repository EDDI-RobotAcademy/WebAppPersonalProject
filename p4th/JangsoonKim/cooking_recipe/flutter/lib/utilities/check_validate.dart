import 'package:flutter/material.dart';

class CheckValidate {
  String? validateEmail(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력해주세요';
    } else if (!value.isValidEmail()) {
      focusNode.requestFocus();
      return '잘못된 이메일 형식입니다.';
    } else {
      return null;
    }
  }

  String? validatePassword(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요';
    } else if (!value.isValidPassword()) {
      focusNode.requestFocus();
      return '소문자, 숫자, 특수문자 포함 8자이상 15자';
    } else {
      return null;
    }
  }

  String? validateNickName(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '닉네임을 입력해주세요';
    } else if (!value.isValidNickName()) {
      focusNode.requestFocus();
      return '한글, 영문 포함 3자이상 10자';
    } else {
      return null;
    }
  }

  String? validateTitle(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '필수 입력 항목입니다.';
    } else if (!value.isValidTitle()) {
      focusNode.requestFocus();
      return '제목은 3자이상 33자 이하로 입력가능합니다.';
    } else {
      return null;
    }
  }

  String? validateContent(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '레시피를 입력해주세요.';
    } else {
      return null;
    }
  }
}

extension InputValidate on String {
  bool isValidEmail() {
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegExp.hasMatch(this);
  }

  bool isValidPassword() {
    final passwordRegExp =
        RegExp(r"^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  bool isValidNickName() {
    final nickNameRegExp = RegExp(r"^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{3,10}$");
    return nickNameRegExp.hasMatch(this);
  }

  bool isValidTitle() {
    final nickNameRegExp = RegExp(r"^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣-!?.@#\$&*~\s]{3,33}$");
    return nickNameRegExp.hasMatch(this);
  }
}

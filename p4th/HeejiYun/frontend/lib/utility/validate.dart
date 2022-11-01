import 'package:flutter/cupertino.dart';

class CheckValidate{
  String? validateEmail(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '이메일을 입력하세요.';
    }else {
      RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
        return '잘못된 이메일 형식입니다.';
      }else{
        return null;
      }
    }
  }

  String? validatePassword(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    }else {
      RegExp regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$');
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();
        return '영문, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      }else{
        return null;
      }
    }
  }

  String? validateNickname(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '닉네임을 입력하세요.';
    }else {
      RegExp regExp = RegExp(r'^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$');
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
        return '한글, 영문, 숫자로 구성된 2 ~ 10자리 닉네임을 입력하세요.';
      }else{
        return null;
      }
    }
  }

}
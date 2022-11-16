import 'dart:js';

import 'package:flutter/material.dart';

import '../../api/spring_sign_up_api.dart';

class CommonSnackBar{

  static SnackBar successSignUP(BuildContext context){
    return SnackBar(
      content: const Text("축하합니다 회원 가입이 성공했습니다!"),
      action: SnackBarAction(
        label: "Go To SignIn",
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, "/sign_in_page");
        },
      ),
    );
  }

  static SnackBar failSignUP(){
    return SnackBar(
      content: Text("죄송합니다 로그인에 실패 했습니다 : " + SpringSignUpApi.response.toString()),
      action: SnackBarAction(
        label: "done",
        textColor: Colors.white,
        onPressed: () {
        },
      ),
    );
  }

  static SnackBar emailFailSnackBar(){
    return SnackBar(
      content: const Text("이메일이 유효 하지 않습니다"),
      action: SnackBarAction(
        label: "Done",
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  static SnackBar nickNameFailSnackBar(){
    return SnackBar(
      content: const Text("닉네임이 유효 하지 않습니다"),
      action: SnackBarAction(
        label: "Done",
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }


  static SnackBar passwordFailSnackBar(){
    return SnackBar(
      content: const Text("비밀 번호가 유효 하지 않습니다"),
      action: SnackBarAction(
        label: "Done",
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SpringApi {
  //내 아이피 사용하기
  //response가 작동하지 않으면 안드로이드 에뮬레이터 문제이므로 10.0.2.2 사용
  static const String httpUri = '10.0.2.2:9955';

  Future<SignInResponse>signIn (SignInRequest request) async {

    var data = { 'email': request.email, 'password': request.password };
    var body = json.encode(data);

    debugPrint("body:" + body); // json형태로 encoding 확인

    final response = await http.post(
      Uri.http(httpUri, '/member/sign-in'),
      headers: {"Content-Type" : "application/json"},
      body: body,
    );

    return SignInResponse(true);
  }
}

class SignInResponse {
  bool? success;
  SignInResponse(this.success);
}

class SignInRequest {
  String email;
  String password;
  SignInRequest(this.email, this.password);
}

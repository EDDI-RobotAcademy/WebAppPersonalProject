import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SpringApi {
  //내 아이피 사용하기
  static const String httpUri = '10.0.2.2:9955';

  Future<SignInResponse>signIn (SignInRequest request) async {

    var data = { 'email': request.email, 'password': request.password };
    var body = json.encode(data);

    debugPrint("body:" + body);

    final response = await http.post(
      Uri.http(httpUri, '/test/sign-in'),
      headers: {"Content-Type" : "application/json"},
      body: body,
    );

    print('response Body : ' + response.body);




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

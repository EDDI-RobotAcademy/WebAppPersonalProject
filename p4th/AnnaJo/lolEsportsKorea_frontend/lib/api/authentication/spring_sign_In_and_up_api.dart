import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpringHttpApi {
  static const String httpUri = '192.168.0.8:8888';
  static var signInResponse;
  static var signUpResponse;

  signInApi(MemberSignInRequest request) async {
    var body = json.encode(request);

    try {
      signInResponse = await http.post(
        Uri.http(httpUri, '/member/sign-in'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e){
      debugPrint(e.toString());
    }
  }

  signUpApi(MemberSignUpRequest request) async {
    var body = json.encode(request);

    try {
      signUpResponse = await http.post(
        Uri.http(httpUri, '/member/sign-up'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e){
      debugPrint(e.toString());
    }
  }
}

class MemberSignInRequest {
  String email;
  String password;

  MemberSignInRequest(this.email, this.password);

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password
  };
}

class MemberSignUpRequest {
  String email;
  String password;
  String nickname;

  MemberSignUpRequest(this.email, this.password, this.nickname);

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password,
    'nickname' : nickname,
  };
}

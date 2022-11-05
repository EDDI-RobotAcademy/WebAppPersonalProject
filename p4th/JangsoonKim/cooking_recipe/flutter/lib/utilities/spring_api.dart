import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpringApi {
  static const String httpUri = '172.30.1.31:7777';

  Future<bool?> emailDuplicate(String email) async {
    var data = {'email': email};
    var body = json.encode(data);

    debugPrint(email);

    var response = await http.post(
      Uri.http(httpUri, 'member/user-email/$email'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (json.decode(response.body) == true) {
      return true;
    } else {
      throw ("이메일 중복");
    }
  }

  Future<bool?> nicknameDuplicate(String nickname) async {
    var data = {'nickname': nickname};
    var body = json.encode(data);

    debugPrint(nickname);

    var response = await http.post(
      Uri.http(httpUri, 'member/user-nickname/$nickname'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (json.decode(response.body) == true) {
      return true;
    } else {
      throw ('닉네임 중복');
    }
  }

  Future<bool?> signUp(UserSignUpRequest request) async {
    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(request.nickname);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-up'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'email': request.email,
        'password': request.password,
        'nickname': request.nickname
      }),
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw ("error");
    }
  }

  Future<UserLoginResponse> login(UserLoginRequest request) async {
    debugPrint("로그인 이메일: " + request.email);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-in'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'email': request.email, 'password': request.password}),
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return UserLoginResponse(true);
    } else {
      throw ("error");
    }
  }
}

class UserSignUpRequest {
  String email;
  String password;
  String nickname;

  UserSignUpRequest(this.email, this.password, this.nickname);
}

class UserLoginResponse {
  bool? success;

  UserLoginResponse(this.success);
}

class UserLoginRequest {
  String email;
  String password;

  UserLoginRequest(this.email, this.password);
}

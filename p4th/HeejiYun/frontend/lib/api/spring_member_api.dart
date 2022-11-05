import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpringMemberApi {
  static const String httpUri = '192.168.1.102:7779';

  Future<bool?> emailCheck ( String email ) async {
    var data = { 'email': email };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(httpUri, '/member/check-email/$email'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    }

    return json.decode(response.body);

  }

  Future<bool?> nicknameCheck (String nickname) async {
    var data = { 'nickname': nickname };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(httpUri, '/member/check-nickname/$nickname'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    }

    return json.decode(response.body);
  }

  Future<bool?> signUp (MemberSignUpRequest request) async {
    var data = { 'email': request.email, 'password': request.password, 'nickname': request.nickname };
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(request.nickname);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-up'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    }

    return json.decode(response.body);
  }

  Future<UserLoginResponse> login (UserLoginRequest request) async {
    var data = { 'email': request.email, 'password': request.password };
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-up'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    }

    return UserLoginResponse(true);
  }
}

class MemberSignUpRequest {
  String email;
  String password;
  String nickname;

  MemberSignUpRequest(this.email, this.password, this.nickname);
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
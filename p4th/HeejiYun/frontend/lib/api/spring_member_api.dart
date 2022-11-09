import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpringMemberApi {
  static const String httpUriHome = '192.168.1.102:7779';
  static const String httpUriTmp = '192.168.0.15:7779';

  Future<bool?> emailCheck ( String email ) async {
    var data = { 'email': email };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(httpUriHome, '/member/check-email/$email'),
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
      Uri.http(httpUriHome, '/member/check-nickname/$nickname'),
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
      Uri.http(httpUriHome, '/member/sign-up'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    }

    return json.decode(response.body);
  }

  Future<SignInResponse> signIn (MemberSignInRequest request) async {
    var data = { 'email': request.email, 'password': request.password };
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUriHome, '/member/sign-in'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      debugPrint(response.body);

      return SignInResponse(response.body);
    } else {
      debugPrint("통신 실패");
      return SignInResponse("로그인 실패");
    }
  }
}

class SignInResponse {
  var userToken;

  SignInResponse(this.userToken);
}

class MemberSignUpRequest {
  String email;
  String password;
  String nickname;

  MemberSignUpRequest(this.email, this.password, this.nickname);
}

class MemberSignInRequest {
  String email;
  String password;

  MemberSignInRequest(this.email, this.password);
}
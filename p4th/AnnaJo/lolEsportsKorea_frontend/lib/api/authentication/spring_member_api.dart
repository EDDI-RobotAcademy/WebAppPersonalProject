import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ipInfo.dart';

class SpringHttpApi {
  static var signInResponse;
  static var signUpResponse;
  static var removeResponse;

  signInApi(MemberSignInRequest request) async {
    var body = json.encode(request);

    try {
      signInResponse = await http.post(
        Uri.http(IpInfo.httpUri, '/member/sign-in'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signUpApi(MemberSignUpRequest request) async {
    var body = json.encode(request);

    try {
      signUpResponse = await http.post(
        Uri.http(IpInfo.httpUri, '/member/sign-up'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  memberRemoveApi(String email) async {
    try {
      removeResponse = await http.post(
        Uri.http(IpInfo.httpUri, '/member/remove/$email'),
        headers: {"Content-Type": "application/json"},
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class MemberSignInRequest {
  String email;
  String password;

  MemberSignInRequest(this.email, this.password);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class MemberSignUpRequest {
  String email;
  String password;
  String nickname;

  MemberSignUpRequest(this.email, this.password, this.nickname);

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'nickname': nickname,
      };
}

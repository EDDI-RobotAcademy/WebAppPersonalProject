import 'dart:convert';

import 'package:flutter/cupertino.dart';
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

    return json.decode(response.body);
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

    return json.decode(response.body);
  }

  Future<bool?> signUp(MemberSignUpRequest request) async {
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
    }

    return json.decode(response.body);
  }
  Future<bool?> login(UserLoginRequest request) async {

    debugPrint(request.email);
    debugPrint(request.password);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-in'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'email': request.email,
        'password': request.password}),
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return true;

    } else{
      return false;
    }
  }
}

class UserValidateResponse {
  bool? success;

  UserValidateResponse(this.success);
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

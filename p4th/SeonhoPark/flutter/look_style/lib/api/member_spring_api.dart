import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MemberSpringApi {
  static const String httpUri = '192.168.0.12:7777';

  Future<UserInfo> signIn (UserSignInRequest request) async {
    var data = { 'email': request.email, 'password': request.password };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(httpUri, '/member/send-info'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    print('가즈아 : ' + response.body);

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return UserInfo.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      debugPrint("통신 실패");
      throw Exception("failed post");
    }
  }


  Future<UserSignUpResponse> signUp (UserSignUpRequest request) async {
    var data = {
      'email': request.email,
      'password': request.password,
      'nickname': request.nickname,
    };
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

    debugPrint(response.body);

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return UserSignUpResponse(true);
    } else {
      debugPrint("통신 실패");
      return UserSignUpResponse(false);
    }
  }

  Future<CheckDuplicateEmailResponse> duplicateEmailValidation (CheckDuplicateEmailRequest request) async {
    var data = {
      'email': request.email,
    };
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/check-email/${request.email}'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    debugPrint(response.body);

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    } else {
      debugPrint("통신 실패");
    }

    if(response.body == "true") {
      return CheckDuplicateEmailResponse(true);
    } else {
      return CheckDuplicateEmailResponse(false);
    }
  }

  Future<CheckDuplicateNicknameResponse> duplicateNicknameValidation (CheckDuplicateNicknameRequest request) async {
    var data = {
      'nickname': request.nickname,
    };
    var body = json.encode(data);

    debugPrint(request.nickname);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/check-nickname/${request.nickname}'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    debugPrint(response.body);

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    } else {
      debugPrint("통신 실패");
    }

    if(response.body == "true") {
      return CheckDuplicateNicknameResponse(true);
    } else {
      return CheckDuplicateNicknameResponse(false);
    }
  }
}

class UserInfo {
  String token;
  String email;
  String nickname;

  UserInfo({
    required this.token,
    required this.email,
    required this.nickname,
  });
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
        token: json['token'],
        email: json['email'],
        nickname: json['nickname']);
  }
}

class CheckDuplicateEmailRequest {
  String email;

  CheckDuplicateEmailRequest(this.email);
}

class CheckDuplicateEmailResponse {
  bool? success;

  CheckDuplicateEmailResponse(this.success);
}

class CheckDuplicateNicknameRequest {
  String nickname;

  CheckDuplicateNicknameRequest(this.nickname);
}

class CheckDuplicateNicknameResponse {
  bool? success;

  CheckDuplicateNicknameResponse(this.success);
}

class UserSignUpResponse {
  bool? success;

  UserSignUpResponse(this.success);
}

class UserSignUpRequest {
  String email;
  String password;
  String nickname;

  UserSignUpRequest(
      this.email,
      this.password,
      this.nickname,
      );
}

class UserSignInResponse {
  bool? success;

  UserSignInResponse(this.success);
}

class UserSignInRequest {
  String email;
  String password;

  UserSignInRequest(this.email, this.password);
}
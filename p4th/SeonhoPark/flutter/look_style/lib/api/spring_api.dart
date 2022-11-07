import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpringApi {
  static const String httpUri = '192.168.0.12:7777';

  Future<UserSignInResponse> SignIn (UserSignInRequest request) async {
    var data = { 'email': request.email, 'password': request.password };
    var body = json.encode(data);

    // debugPrint(request.email);
    // debugPrint(request.password);
    // debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-in'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    // debugPrint(response.body);

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return UserSignInResponse(true);
    } else {
      debugPrint("통신 실패");
      return UserSignInResponse(false);
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

  Future<UserSignUpDuplicateEmailValidationResponse> duplicateEmailValidation (UserSignUpDuplicateEmailValidationRequest request) async {
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
      return UserSignUpDuplicateEmailValidationResponse(true);
    } else {
      return UserSignUpDuplicateEmailValidationResponse(false);
    }
  }

  Future<UserSignUpDuplicateNicknameValidationResponse> duplicateNicknameValidation (UserSignUpDuplicateNicknameValidationRequest request) async {
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
      return UserSignUpDuplicateNicknameValidationResponse(true);
    } else {
      return UserSignUpDuplicateNicknameValidationResponse(false);
    }
  }
}

class UserSignUpDuplicateEmailValidationRequest {
  String email;

  UserSignUpDuplicateEmailValidationRequest(this.email);
}

class UserSignUpDuplicateEmailValidationResponse {
  bool? success;

  UserSignUpDuplicateEmailValidationResponse(this.success);
}

class UserSignUpDuplicateNicknameValidationRequest {
  String nickname;

  UserSignUpDuplicateNicknameValidationRequest(this.nickname);
}

class UserSignUpDuplicateNicknameValidationResponse {
  bool? success;

  UserSignUpDuplicateNicknameValidationResponse(this.success);
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
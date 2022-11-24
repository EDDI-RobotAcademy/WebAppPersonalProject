import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../utility/http_uri.dart';

class SpringMemberApi {

  Future<bool?> emailCheck ( String email ) async {
    var data = { 'email': email };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(HttpUri.home, '/member/check-email/$email'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw Exception("통신 실패");
    }

  }

  Future<bool?> nicknameCheck (String nickname) async {
    var data = { 'nickname': nickname };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(HttpUri.home, '/member/check-nickname/$nickname'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw Exception("통신 실패");
    }
  }

  Future<bool?> signUp (MemberSignUpRequest request) async {
    var data = { 'email': request.email, 'password': request.password, 'nickname': request.nickname };
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(request.nickname);
    debugPrint(body);

    var response = await http.post(
      Uri.http(HttpUri.home, '/member/sign-up'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw Exception("통신 실패");
    }
  }

  Future<SignInResponse> signIn (MemberSignInRequest request) async {
    var data = { 'email': request.email, 'password': request.password };
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(body);

    var response = await http.post(
      Uri.http(HttpUri.home, '/member/sign-in'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      debugPrint(response.body);

      return SignInResponse(response.body);
    } else {
      throw Exception("통신 실패");
    }
  }

  Future<UserDataResponse> requestUserData(String? userToken) async {

    var data = { 'userToken' : userToken };
    var body = json.encode(data);

    var response = await http.post(
        Uri.http(HttpUri.home, '/member/data-read'),
        headers: {"Content-Type": "application/json"},
        body: body,);

    if (response.statusCode == 200) {
      debugPrint("통신 확인");

      var jsonResData = jsonDecode(utf8.decode(response.bodyBytes));
      UserDataResponse resData = UserDataResponse.fromJson(jsonResData);

      return resData;
    } else {
      throw Exception("통신 실패");
    }
  }

  Future<bool?> requestSignOut (String? userToken) async {
    var data = { 'userToken': userToken };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(HttpUri.home, '/member/sign-out'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw Exception("통신 실패");
    }
  }

  Future<bool?> requestModifyUserData (ModifyUserDataRequest request) async {
    var data = { 'userToken': request.userToken, 'modifyNickname' : request.modifyNickname };
    var body = json.encode(data);

    var response = await http.put(
      Uri.http(HttpUri.home, '/member/data-modify'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw Exception("통신 실패");
    }
  }

  Future<bool?> requestUnregister (String? userToken) async {
    var data = { 'userToken': userToken };
    var body = json.encode(data);

    var response = await http.delete(
      Uri.http(HttpUri.home, '/member/unregister'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw Exception("통신 실패");
    }
  }
}

class UserDataResponse {
  String userEmail;
  String userNickname;

  UserDataResponse({required this.userEmail, required this.userNickname});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    return UserDataResponse(
        userEmail: json["userEmail"] as String,
        userNickname: json["userNickname"] as String
    );
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

class ModifyUserDataRequest {
  String userToken;
  String modifyNickname;

  ModifyUserDataRequest(this.userToken, this.modifyNickname);
}

class MemberSignInRequest {
  String email;
  String password;

  MemberSignInRequest(this.email, this.password);
}
import 'dart:convert';

import 'package:demo/screens/login_screen.dart';
import 'package:demo/widgets/screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SpringApi {
  static const String httpUrl = '172.30.1.3:7777';

  Future<bool?> emailDuplicate(String email) async {
    var data = {'email': email};
    var body = json.encode(data);

    debugPrint(email);

    var response = await http.post(
      Uri.http(httpUrl, 'member/user-email/$email'),
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
      Uri.http(httpUrl, 'member/user-nickname/$nickname'),
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
      Uri.http(httpUrl, '/member/sign-up'),
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
    debugPrint('로그인 이메일: ' + request.email);

    var any = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.http(httpUrl, '/member/sign-in'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'email': request.email, 'password': request.password}),
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      print(response.body);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      any.setString("userData", jsonData['userToken']);
      any.setString("userEmail", jsonData['memberEmail']);
      any.setString("userNickname", jsonData['memberNickname']);
      Get.off(() => const ScreenController());
      return UserLoginResponse(true);
    } else {
      throw ("error");
    }
  }
  Future<bool> tryAutoLogin()async{
    var any = await SharedPreferences.getInstance();
    if(!any.containsKey("userData")){
      return false;
    }
    else{
      return true;
    }
  }
  static logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.off(() => const LoginScreen());
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


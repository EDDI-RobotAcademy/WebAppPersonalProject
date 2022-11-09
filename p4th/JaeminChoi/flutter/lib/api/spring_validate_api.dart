import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:leaing_helper/api/GlobalsSuccessCheck.dart';

class SpringValidateApi{
  static const String httpUri = '192.168.0.8:7777';

  Future<UserValidateResponse> emailValidate(String email) async {
    var data = {'email' : email};
    var body = json.encode(data);

    debugPrint(email);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, 'member/check-email/$email'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    }

    return UserValidateResponse(true);
  }

  Future<UserValidateResponse> nickNameValidate(String nickName) async {
    var data = {'nickName' : nickName };
    var body = json.encode(data);

    debugPrint(nickName);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, 'member/check-nickName/$nickName'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      GlobalsSuccessCheck.isNicknameCheck = true;
      return UserValidateResponse(true);
    }else{
      debugPrint("실패");
      return UserValidateResponse(false);
    }

  }
}

class UserValidateResponse {
  bool? success;

  UserValidateResponse(this.success);
}


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'globals_success_check.dart';

class SpringNicknameValidationApi {
  static const String httpUri = '192.168.0.8:8888';


  Future<UserNicknameValidationResponse> nicknameValidation(String nickname) async {
    var data = {'nickname': nickname};
    var body = json.encode(data);

    debugPrint(nickname);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/check-nickname/$nickname'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("Success");
      GlobalsSuccessCheck.isNicknameCheck = true;
      return UserNicknameValidationResponse(true);
    } else {
      debugPrint("Fail");
      return UserNicknameValidationResponse(false);
    }
  }
}

class UserNicknameValidationResponse {
  bool? success;

  UserNicknameValidationResponse(this.success);

}

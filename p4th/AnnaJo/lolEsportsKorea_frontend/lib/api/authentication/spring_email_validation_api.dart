import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'globals_success_check.dart';

class SpringEmailValidationApi {
  static const String httpUri = '192.168.0.8:8888';


  Future<UserEmailValidationResponse> emailValidation(String email) async {
    var data = {'email': email};
    var body = json.encode(data);

    debugPrint(email);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/check-email/$email'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("emailValidation Success");
      GlobalsSuccessCheck.isEmailCheck = true;
      return UserEmailValidationResponse(true);
    } else {
      debugPrint("Fail");
      return UserEmailValidationResponse(false);
    }
  }
}

class UserEmailValidationResponse {
  bool? success;

  UserEmailValidationResponse(this.success);

}

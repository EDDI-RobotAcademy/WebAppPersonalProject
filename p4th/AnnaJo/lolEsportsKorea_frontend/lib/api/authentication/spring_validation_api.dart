import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ipInfo.dart';

class SpringValidationApi {
  static var emailValidationResponse;
  static var nicknameValidationResponse;

  emailValidation(String email) async {
    var data = {'email': email};
    var body = json.encode(data);

    debugPrint(email);
    debugPrint(body);
    try {
      emailValidationResponse = await http.post(
        Uri.http(IpInfo.httpUri, '/member/check-email/$email'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  nicknameValidation(String nickname) async {
    var data = {'nickname': nickname};
    var body = json.encode(data);

    debugPrint(nickname);
    debugPrint(body);
    try {
      nicknameValidationResponse = await http.post(
        Uri.http(IpInfo.httpUri, '/member/check-nickname/$nickname'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}

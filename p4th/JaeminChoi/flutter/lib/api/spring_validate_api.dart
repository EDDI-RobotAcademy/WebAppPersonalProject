import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpringValidateApi{
  static const String httpUri = '192.168.0.8:7777';

  emailValidate(String email) async {
    var data = {'email' : email};
    var body = json.encode(data);

    debugPrint(email);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, 'member/check-email/$email'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return UserValidateResponse(true);
  }

  nickNameValidate(String nickName) async {
    var data = {'nickName' : nickName };
    var body = json.encode(data);

    debugPrint(nickName);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, 'member/check-nickName/$nickName'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return UserValidateResponse(true);
  }
}

class UserValidateResponse {
  bool? success;

  UserValidateResponse(this.success);
}


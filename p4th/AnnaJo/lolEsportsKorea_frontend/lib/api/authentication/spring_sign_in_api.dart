import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lol_esports_korea_app/api/authentication/globals_success_check.dart';

class SpringSignInApi {
  static const String httpUri = '192.168.0.8:8888';

  Future<UserSignInResponse> signIn(UserSignInRequest request) async {
    var data = {'email': request.email, 'password': request.password};
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-in'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("Success");
      GlobalsSuccessCheck.isSignInCheck = true;
      return UserSignInResponse(true);
    } else {
      debugPrint("Fail");
      return UserSignInResponse(false);
    }
  }
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

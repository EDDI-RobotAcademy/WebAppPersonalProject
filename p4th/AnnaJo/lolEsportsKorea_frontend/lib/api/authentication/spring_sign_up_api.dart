import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lol_esports_korea_app/api/authentication/globals_success_check.dart';

class SpringSignUpApi {
  static const String httpUri = '192.168.0.8:8888';

  Future<MemberSignUpResponse> signUp(MemberSignUpRequest request) async {
    var data = {
      'email': request.email,
      'password': request.password,
      'nickname': request.nickname
    };
    var body = json.encode(data);

    debugPrint(request.email);
    debugPrint(request.password);
    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-up'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("Success");
      GlobalsSuccessCheck.isSignUpCheck = true;
      return MemberSignUpResponse(true);
    } else {
      debugPrint("Fail");
      return MemberSignUpResponse(false);
    }
  }
}

class MemberSignUpResponse {
  bool? success;

  MemberSignUpResponse(this.success);
}

class MemberSignUpRequest {
  String email;
  String password;
  String nickname;

  MemberSignUpRequest(this.email, this.password, this.nickname);
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'info/sign_in_info.dart';

class SpringSignInApi {
  static const String httpUri = '192.168.0.8:7776';
  static var response;
  login (SignInAccount account) async {
    
      var data = { 'email': account.email, 'password': account.password };
      var body = json.encode(data);

      debugPrint(body);

      var response = await http.post(
        Uri.http(httpUri, '/member/sign-in'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        debugPrint("통신 확인");
        return true;
      }else{
        debugPrint("error");
        return false;
     }
  }

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
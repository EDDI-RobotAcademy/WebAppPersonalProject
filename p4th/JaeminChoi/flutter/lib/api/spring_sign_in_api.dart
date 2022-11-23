import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:leaing_helper/api/state/sign_in_validate_state.dart';

import 'info/sign_in_info.dart';

class SpringSignInApi {
  static const String httpUri = '192.168.0.8:7776';
  static var resToken;
  static var userNickName;
  static var userEmail;
  static var isAdmin;
  static var isAuthenticated;
  login (SignInAccount account) async {
      userNickName = "";
      userEmail ="";
      var data = { 'email': account.email, 'password': account.password };
      var body = json.encode(data);

      debugPrint(body);
      try{
        var signInResponse = await http.post(
          Uri.http(httpUri, '/member/sign-in'),
          headers: {"Content-Type": "application/json"},
          body: body,
        );

        if(signInResponse.statusCode == 200){
          resToken = jsonDecode(signInResponse.body);
          SignInValidateState.isSignInCheck =true;
          userNickName = resToken['Nickname'];
          userEmail = resToken['Email'];
          isAdmin = resToken['Admin'];
        }
      }catch(e){
        debugPrint("오류 발생 " + e.toString());
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
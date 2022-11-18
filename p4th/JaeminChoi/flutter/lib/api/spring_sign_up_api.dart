import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'info/sign_up_info.dart';


class SpringSignUpApi {
  static var response;

  static const String httpUri = '192.168.0.8:7776';

  signUp (SignUpAccount account) async {
    var data = { 'email': account.email, 'password': account.password ,'nickName' :account.nickName };
    var body = json.encode(data);

    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, '/member/sign-up'),
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

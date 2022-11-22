import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:leaing_helper/api/state/sign_up_validate_state.dart';

import 'info/sign_up_info.dart';


class SpringSignUpApi {
  static var SignUpresponse;

  static const String httpUri = '192.168.0.8:7776';

  signUp (SignUpAccount account) async {
    var data = { 'email': account.email, 'password': account.password ,'nickName' :account.nickName };
    var body = json.encode(data);
    debugPrint(body);
    try{
      var SignUpresponse = await http.post(
        Uri.http(httpUri, '/member/sign-up'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if(SignUpresponse.statusCode == 200){
        debugPrint("통신완료");
        var result = jsonDecode(SignUpresponse.body);
        debugPrint("result :" + result.toString());

        if (result == true) {
          SignUpValidateState.isSignUpCheck = true;
        }
      }
    }catch(e){
      debugPrint("오류 발생" + e.toString());
    }
  }
}

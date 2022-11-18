import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:leaing_helper/api/state/sign_up_validate_state.dart';

class SpringValidateApi{
  static const String httpUri = '192.168.0.8:7776';
  static final PASSVALIDATE = true;
  static final FAILVALIDATE = false;

  static final isRESPONSEVALIDATE = 0;
  //이메일 중복 검증
  emailValidate(String email) async {

      var data = {'email' : email};
      var body = json.encode(data);

      debugPrint(body);
      debugPrint("emailValidate() 실행됨");

      var response = await http.post(
        Uri.http(httpUri, '/member/check-email/$email'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        debugPrint("통신 확인");
        var result =  json.decode(response.body);
        debugPrint(result.toString());
        if(result == isRESPONSEVALIDATE){
          debugPrint("닉네임 사용 가능");
          SignUpValidateState.isEmailCheck = PASSVALIDATE;
        }else{
          debugPrint("닉네임 사용 불가능");
          SignUpValidateState.isEmailCheck = FAILVALIDATE;
        }
      }else{
        debugPrint("통신 실패");
        SignUpValidateState.isEmailCheck = FAILVALIDATE;
      }
  }
  //닉네임 중복 검증
  nickNameValidate(String nickName) async {
    var data = {'nickName' : nickName };
    var body = json.encode(data);

    debugPrint(body);

    var response = await http.post(
      Uri.http(httpUri, 'member/check-nickName/$nickName'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      var result =  json.decode(response.body);
      debugPrint(result.toString());
      if(result == isRESPONSEVALIDATE){
        debugPrint("닉네임 사용 가능");
        SignUpValidateState.isNicknameCheck = PASSVALIDATE;
      }else{
        debugPrint("닉네임 사용 불가능");
        SignUpValidateState.isNicknameCheck = FAILVALIDATE;
      }
    }else{
      debugPrint("통신 실패");
      SignUpValidateState.isNicknameCheck = FAILVALIDATE;
    }

  }
}


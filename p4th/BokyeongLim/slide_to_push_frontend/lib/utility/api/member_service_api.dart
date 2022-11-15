import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../controller/dto/sign_in_req_dto.dart';
import '../../controller/dto/sign_up_req_dto.dart';


class MemberService {
  static const String httpUri = '192.168.200.183:9955';
      // '10.0.2.2:9955';
  static var resEmailValidation;
  static var resSignUp;
  static var resToken;

  //회원가입 로그인
  static Future<bool> emailValidation(String email) async {
    var data = {'email': email};
    var body = json.encode(data);

    try{
      resEmailValidation = await http.post(
        Uri.http(httpUri, '/member/check-email/$email'),
        headers: {"Content-Type": "application/json"},
        body: body
      );

    }catch (e){
      debugPrint(e.toString());
    }

    // 왜인지 모르겠지만 스트링으로 결과값이 받아짐.
    String res = resEmailValidation.body;

    if(res == 'true') {
      return true;
    } else {
      return false;
    }

  }
  static Future<String> requestSignIn(String email, String password) async {
    SignInReqDto data = SignInReqDto(email, password);
    var body = json.encode(data);

    try {
      resToken = await http.post(
        Uri.http(httpUri, '/member/sign-in'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    String token = resToken.body;

    if(token.length != 36) {
      print(token);
      return "-1";
    } else {
      print("API 문제 없음 :"  + token);
      return token;
    }
  }
  static Future<bool> requestSignUp(String email, String password, String nickname) async {
    SignUpReqDto data = SignUpReqDto(email, password, nickname);
    var body = json.encode(data);

    try {
      resSignUp = await http.post(
        Uri.http(httpUri, '/member/sign-up'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    String res = resSignUp.body;
    print(res.toString() + "api");
    if(res == 'true') {
      return true;
    } else {
      return false;
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../controller/dto/sign_in_req_dto.dart';



class MemberService {
  static const String httpUri = '192.168.200.183:9955';
      // '10.0.2.2:9955';
  static var resEmailValidation;
  static var resSignUp;
  static var resToken;

  //회원가입 로그인
  // emailValidation(String email) async {
  //   var data = {'email': email};
  //   var body = json.encode(data);
  //
  //   try{
  //     resEmailValidation = await http.post(
  //       Uri.http(httpUri, '/member/check-email/$email'),
  //       headers: {"Content-Type": "application/json"},
  //       body: body,
  //     );
  //
  //   }catch (e){
  //     debugPrint(e.toString());
  //   }
  // }
  // signUpService() async {
  //   var body = json.encode(account);
  //
  //   try {
  //     resSignUp = await http.post(
  //       Uri.http(httpUri, '/member/sign-up'),
  //       headers: {"Content-Type": "application/json"},
  //       body: body,
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
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

}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slide_to_push_frontend/api/states/account_info.dart';
import 'package:slide_to_push_frontend/api/states/sign_in_info.dart';

class HttpService {
  static const String httpUri = '10.0.2.2:9955';
  static var resEmailValidation;
  static var resSignUp;
  static var resSignIn;
  static var reqList;
  static var reqDeleteBoard;
  static var reqChangeStatus;

  //회원가입 로그인
  emailValidation(String email) async {
    var data = {'email': email};
    var body = json.encode(data);

    try{
      resEmailValidation = await http.post(
        Uri.http(httpUri, '/member/check-email/$email'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

    }catch (e){
      debugPrint(e.toString());
    }
  }
  signUpService(Account account) async {
    var body = json.encode(account);

    try {
      resSignUp = await http.post(
        Uri.http(httpUri, '/member/sign-up'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  signInService(SignInAccount account) async {
    var body = json.encode(account);

    try {
      resSignIn = await http.post(
        Uri.http(httpUri, '/member/sign-in'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //투두리스트
  requestListFromSpring() async {
    try {
      reqList = await http.get(
        Uri.http(httpUri, '/todos/list'),
        headers: {"Content-Type": "application/json"},
      );

    } catch (e) {
      debugPrint(e.toString());
    }
  }
  requestListDeleteFromSpring(int boardNo) async {
    var data = {'boardNo': boardNo};
    var body = json.encode(data);

    try{
      reqDeleteBoard = await http.delete(
        Uri.http(httpUri, '/todos/$boardNo'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

    }catch (e){
      debugPrint(e.toString());
    }
  }
  requestListChangeStatusFromSpring(int boardNo) async {
    var data = {'boardNo': boardNo};
    var body = json.encode(data);

    debugPrint(body.toString());
    try{
      reqChangeStatus = await http.put(
        Uri.http(httpUri, '/todos/change-status/$boardNo'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

    }catch (e){
      debugPrint(e.toString());
    }
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static const String httpUri = '10.0.2.2:9955';
  static var resEmailValidation;
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
}
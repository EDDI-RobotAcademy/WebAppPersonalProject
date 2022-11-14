import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/todos.dart';
import '../states/authentication.dart';

class TodosService {
  static const String httpUri = '192.168.200.183:9955';
  static var reqList;
  static var reqChangeStatus;
  static var reqRegisterTodos;
  static var reqDelete;


  static Future<List<Todos>?> fetchTodos() async{

    var response = await http.get(
      Uri.http(httpUri, '/todos/list',),
      headers: {
        "Authentication" : Auth.authToken,
        "Content-Type": "application/json"
      },
    );

    if(response.statusCode == 200) {
      var jsonData = utf8.decode(response.bodyBytes);
      print(jsonData);
      return todosFromJson(jsonData);
    } else {
      return null;
    }
  }
  static requestChangeTodosStatusFromSpring(int boardNo) async {
    var data = {'boardNo': boardNo};
    var body = json.encode(data);

    debugPrint(body.toString());
    try{
      reqChangeStatus = await http.put(
        Uri.http(httpUri, '/todos/$boardNo'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

    }catch (e){
      debugPrint(e.toString());
    }
  }
  static requestRegisterTodos(String content, String selectedDate) async{
    var data = {
      'content': content,
      'isFinished': false,
      'selectedDate': selectedDate,
      'token':Auth.authToken
    };
    var body = json.encode(data);

    try {
      reqRegisterTodos = await http.post(
        Uri.http(httpUri, '/todos/register'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  //우선 등록에만 토큰으로 사용자 인증 후 할 수 있도록 서버 설계 , 삭제는 우선 보드 넘버만..
  static requestDeleteFromSpring(int boardNo) async {
    var data = {'boardNo': boardNo};
    var body = json.encode(data);

    try{
      reqDelete = await http.delete(
        Uri.http(httpUri, '/todos/$boardNo'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

    }catch (e){
      debugPrint(e.toString());
    }
  }
}
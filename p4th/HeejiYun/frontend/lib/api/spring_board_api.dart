import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../utility/http_uri.dart';
import 'board.dart';

class SpringBoardApi{
  Future<List<Board>?> requestEveryBoardList() async {

    var response = await http.get(
      Uri.http(HttpUri.home, '/board/list'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");

      debugPrint(jsonDecode(utf8.decode(response.bodyBytes)).toString()); //json으로 받은걸 toString
      var jsonBoard = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      List<Board> list = jsonBoard.map((dataJson)=>Board.fromJson(dataJson)).toList();

      return list;

    } else {
      throw Exception("통신 실패");
    }
  }

  Future<List<Board>?> requestSpecificBoardList(String category) async {

    var response = await http.get(
        Uri.http(HttpUri.home, '/board/list/$category'),
        headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");

      debugPrint(jsonDecode(utf8.decode(response.bodyBytes)).toString()); //json으로 받은걸 toString
      var jsonBoard = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      List<Board> list = jsonBoard.map((dataJson)=>Board.fromJson(dataJson)).toList();

      return list;

    } else {
      throw Exception("통신 실패");
    }
  }
}
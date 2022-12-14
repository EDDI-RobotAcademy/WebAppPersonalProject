import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../utility/http_uri.dart';
import 'board.dart';

class SpringBoardApi{
  Future<void> requestBoardDelete(int boardNo) async {

    var response = await http.delete(
      Uri.http(HttpUri.home, '/board/$boardNo'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    } else {
      throw Exception("통신 실패");
    }
  }

  Future<Board> requestBoardModify(BoardModifyRequest request) async {
    var boardNo = request.boardNo;
    var data = { 'title': request.title, 'content' : request.content};
    var body = json.encode(data);

    var response = await http.put(
        Uri.http(HttpUri.home, '/board/$boardNo'),
        headers: {"Content-Type": "application/json"},
        body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");

      var jsonBoard = jsonDecode(utf8.decode(response.bodyBytes));
      Board responseBoard = Board.fromJson(jsonBoard);

      return responseBoard;
    } else {
      throw Exception("통신 실패");
    }
  }


  Future<bool> requestBoardRegister(BoardRegisterRequest request) async {
    var data = { 'title': request.title, 'writer': request.writer,
                'content' : request.content, 'boardCategoryName' : request.boardCategoryName };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(HttpUri.home, '/board/register'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return json.decode(response.body);
    } else {
      throw Exception("통신 실패");
    }
  }

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

  Future<List<Board>?> requestSpecificBoardList(String categoryName) async {

    var response = await http.get(
        Uri.http(HttpUri.home, '/board/list/$categoryName'),
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

class BoardRegisterRequest {
  String title;
  String writer;
  String content;
  String boardCategoryName;

  BoardRegisterRequest(this.title, this.writer, this.content, this.boardCategoryName);
}

class BoardModifyRequest {
  int boardNo;
  String title;
  String content;

  BoardModifyRequest(this.boardNo, this.title, this.content);
}
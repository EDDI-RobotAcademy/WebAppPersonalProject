import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class BoardSpringApi {

  static const String httpUri = '192.168.0.12:7777';

  Future<bool?> boardRegister(Board board, List<XFile> images) async {

    Dio dio = Dio();

    final List<MultipartFile> _files = images.map((img) => MultipartFile.fromFileSync(
      img.path,
      contentType: MediaType('image', 'jpg')
    )).toList();

    FormData _formData = FormData.fromMap({
      'file': _files,
      'form' : MultipartFile.fromString(
        jsonEncode({
          'title' : board.title,
          'writer' : board.writer,
          'content' : board.content,
          'boardType' : board.boardType
        }),
        contentType: MediaType.parse('application/json'),
      )
    });

    var response = await dio.post('http://192.168.0.12:7777/board/register',
        data: _formData);

    if (response.statusCode == 200) {
      debugPrint("통신 성공!");
      return true;
    } else {
      debugPrint("통신 실패....");
      return false;
    }
  }

  Future<bool?> boardRegisterWithoutImage(Board board) async {

    Dio dio = Dio();

    FormData _formData = FormData.fromMap({
      'form' : MultipartFile.fromString(
        jsonEncode({
          'title' : board.title,
          'writer' : board.writer,
          'content' : board.content,
          'boardType' : board.boardType
        }),
        contentType: MediaType.parse('application/json'),
      )
    });

    var response = await dio.post('http://192.168.0.12:7777/board/register',
        data: _formData);

    if (response.statusCode == 200) {
      debugPrint("통신 성공!");
      return true;
    } else {
      debugPrint("통신 실패....");
      return false;
    }
  }

  Future<List<RequestBoard>> boardList(String boardType) async {

    var response = await http.get(
        Uri.http(httpUri, '/board/list/$boardType'),
        headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      debugPrint('통신 확인');
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      List<RequestBoard> boardList = data.map((list) =>
          RequestBoard.fromJson(list)).toList();

      print(boardList);

      return boardList;
    } else {
      throw Exception('에러');
    }
  }
}

class Board {
  String title;
  String content;
  String writer;
  String boardType;

  Board(this.title, this.content, this.writer, this.boardType);
}

class RequestBoard {
  int boardNo;
  String title;
  String writer;
  String content;
  String regDate;
  String updDate;
  String boardType;

  RequestBoard({
    required this.boardNo,
    required this.title,
    required this.writer,
    required this.content,
    required this.regDate,
    required this.updDate,
    required this.boardType
  });

  factory RequestBoard.fromJson(Map<String, dynamic> json) {
    return RequestBoard(
        boardNo: json['boardNo'],
        title: json['title'],
        writer: json['writer'],
        content: json['content'] ,
        regDate: json['regDate'],
        updDate: json['updDate'],
        boardType: json['boardType']
    );
  }
}
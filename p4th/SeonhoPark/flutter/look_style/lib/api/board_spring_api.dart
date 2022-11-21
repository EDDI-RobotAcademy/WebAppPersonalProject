import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class BoardSpringApi {

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
}

class Board {
  String title;
  String content;
  String writer;
  String boardType;

  Board(this.title, this.content, this.writer, this.boardType);
}
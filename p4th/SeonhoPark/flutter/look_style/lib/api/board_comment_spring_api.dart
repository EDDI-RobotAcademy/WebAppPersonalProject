import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoardCommentSpringApi {

  static const String httpUri = '192.168.0.12:7777';

  Future<bool?> registerComment(Comment comment) async {
    var data = {
      'boardNo' : comment.boardNo,
      'writer' : comment.writer,
      'content' : comment.content,
    };
    var body = json.encode(data);

    var response = await http.post(
      Uri.http(httpUri, '/comment/register'),
      headers: {"Content-Type": "application/json"},
      body: body
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  Future<List<RequestComment>> findAllCommentsOnSpecificBoard(int boardNo) async {
    var response = await http.get(
        Uri.http(httpUri, '/comment/find/comments/${boardNo}'),
        headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      List<RequestComment> commentList = data.map((list) =>
          RequestComment.fromJson(list)).toList();

      return commentList;
    } else {
      throw Exception('댓글리스트 요청 에러');
    }
  }

  Future<bool?> modifyComment(int commentId, String writer, String content, String regDate, int boardNo) async {
    var data = {
      'commentId' : commentId,
      'writer' : writer,
      'content' : content,
      'regDate' : regDate
    };
    var body = json.encode(data);

    var response = await http.put(
        Uri.http(httpUri, '/comment/modify/$boardNo'),
        headers: {"Content-Type": "application/json"},
        body: body
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> deleteComment(int commentId) async {
    var response = await http.delete(
        Uri.http(httpUri, '/comment/delete/$commentId'),
        headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

class Comment {
  int boardNo;
  String writer;
  String content;

  Comment(this.boardNo, this.writer, this.content);
}

class RequestComment {
  int commentId;
  String writer;
  String content;
  String regDate;
  String updDate;

  RequestComment({required this.commentId, required this.writer, required this.content, required this.regDate, required this.updDate});

  factory RequestComment.fromJson(Map<String, dynamic> json) {
    return RequestComment(
        commentId: json['id'],
        writer: json['writer'],
        content: json['content'],
        regDate: json['regDate'],
        updDate: json['updDate']
    );
  }
}
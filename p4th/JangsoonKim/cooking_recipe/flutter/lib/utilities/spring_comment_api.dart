import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpringCommentApi {
  static const String httpUrl = '172.30.1.3:7777';

  Future<bool?> createComment(CreateCommentRequest request) async {
    debugPrint(request.nickname);
    debugPrint(request.content);

    var response = await http.post(
      Uri.http(httpUrl, '/comment/register'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'writer': request.nickname,
        'content': request.content,
        'recipeNo': request.recipeNo
      }),
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      return true;
    } else {
      throw Exception("error");
    }
  }

  Future<List<CommentListRequest>?> commentList(int recipeNo) async {
    var response = await http.get(Uri.http(httpUrl, '/comment/$recipeNo'),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      debugPrint("통신 확인");

      var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      print(jsonData);

      List<CommentListRequest> commentList = jsonData
          .map((dataJson) => CommentListRequest.fromJson(dataJson))
          .toList();

      return commentList;
    } else {
      throw Exception("error");
    }
  }
  Future<void> commentModify(CommentModifyRequest request) async {
    var response = await http.put(
      Uri.http(httpUrl, '/comment/${request.commentNo}'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'commentNo': request.commentNo,
        'content': request.content
      }),
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    } else {
      throw Exception("error");
    }
  }
  Future<void> commentDelete(int commentNo) async {
    var response = await http.delete(
      Uri.http(httpUrl, '/comment/$commentNo'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    } else {
      throw Exception("error");
    }
  }
}

class CreateCommentRequest {
  final String nickname;
  final String content;
  final int recipeNo;

  CreateCommentRequest(this.nickname, this.content, this.recipeNo);
}

class CommentListRequest {
  int commentNo;
  String content;
  String writer;
  String regDate;

  CommentListRequest(
      {required this.commentNo,
      required this.content,
      required this.writer,
      required this.regDate});

  factory CommentListRequest.fromJson(Map<String, dynamic> json) {
    return CommentListRequest(
        commentNo: json["id"],
        content: json["content"],
        writer: json["writer"],
        regDate: json["regDate"]);
  }
}
class CommentModifyRequest {
  int commentNo;
  String content;

  CommentModifyRequest({
    required this.commentNo,
    required this.content,
  });
}
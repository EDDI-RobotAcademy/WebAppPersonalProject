import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../components/my_team/team_comment_data.dart';

class SpringCommentApi {
  static const String httpUri = '192.168.0.8:8888';
  static var commentRegisterResponse;
  static var commentDeleteResponse;

  static Future<List<TeamCommentData>> getCommentListApi(
      String request) async {
    try {
      final commentListResponse = await http.get(
        Uri.http(httpUri, '/comment/$request'),
        headers: {"Content-Type": "application/json"},
      );
      String responseBody = utf8.decode(commentListResponse.bodyBytes);
      if (commentListResponse.statusCode == 200) {
        List<TeamCommentData> list = parseComments(responseBody);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  registerApi(CommentRequest request) async {
    var body = json.encode(request);

    try {
      commentRegisterResponse = await http.post(
        Uri.http(httpUri, '/comment/register'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteApi(CommentRequest request) async {
    var body = json.encode(request);

    try {
      commentDeleteResponse = await http.post(
        Uri.http(httpUri, '/comment/delete'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static List<TeamCommentData> parseComments(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed
        .map<TeamCommentData>((json) => TeamCommentData.fromJson(json))
        .toList();
  }
}

class CommentRequest {
  String myTeam;
  String nickName;
  String teamProfile;
  String contents;
  String date;

  CommentRequest(
      this.myTeam, this.nickName, this.teamProfile, this.contents, this.date);

  Map<String, String> toJson() => {
        'myTeam': myTeam,
        'nickName': nickName,
        'teamProfile': teamProfile,
        'contents': contents,
        'date': date
      };
}

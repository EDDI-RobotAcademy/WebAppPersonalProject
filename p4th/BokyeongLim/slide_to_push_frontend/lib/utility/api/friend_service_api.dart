import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../model/friend.dart';
import '../states/authentication.dart';

class FriendService {
  static const String httpUri = '192.168.200.183:9955';

  // '10.0.2.2:9955';

  static Future<List<Friend>?> fetchFriends() async {
    var response = await http.get(
      Uri.http(httpUri, '/friend/list',),
      headers: {
        "Authentication": Auth.authToken,
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      var jsonData = utf8.decode(response.bodyBytes);
      debugPrint(jsonData.toString() + "지금 무슨일이 일어나고 있나요?");
      return friendFromJson(jsonData);
    } else {
      return null;
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../model/friend.dart';
import '../states/authentication.dart';

class FriendService {
  static const String httpUri = '192.168.200.183:9955';
  static var reqDeleteFriend;
  static var reqAddFriend;
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
  static requestDeleteFriend(String friendEmail) async {
    var data = {'friendEmail': friendEmail , "token" : Auth.authToken};
    var body = json.encode(data);

    try{
      reqDeleteFriend = await http.delete(
        Uri.http(httpUri, '/friend/delete'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

    }catch (e){
      debugPrint(e.toString());
    }
  }
  static Future<dynamic>requestAddFriend(String friendEmail) async {
    var data = {'friendEmail': friendEmail , "token" : Auth.authToken};
    var body = json.encode(data);

    try{
      reqAddFriend = await http.post(
        Uri.http(httpUri, '/friend/add'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

    }catch (e){
      debugPrint(e.toString());
    }

    print(jsonDecode(reqAddFriend.body));

    return jsonDecode(reqAddFriend.body);
  }
}
import 'dart:convert';

List<Friend> friendFromJson(String str) =>
    List<Friend>.from(jsonDecode(str).map((x) => Friend.fromJson(x)));
String friendToJson(List<Friend> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Friend{
  var myAccount;
  var friendedAccount;
  final String friendEmail;

  Friend({
    required this.myAccount,
    required this.friendedAccount,
    required this.friendEmail
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      myAccount: json["myAccount"],
      friendedAccount: json["friendedAccount"],
      friendEmail: json["friendEmail"],
    );
  }

  Map<String, dynamic> toJson() => {
    "myAccount" : myAccount,
    "friendedAccount" : friendedAccount,
    "friendEmail" : friendEmail
  };


}

import 'dart:convert';

List<Friend> friendFromJson(String str) =>
    List<Friend>.from(jsonDecode(str).map((x) => Friend.fromJson(x)));
String friendToJson(List<Friend> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Friend{
  final String email;

  Friend({required this.email});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {
    "email" : email,
  };


}

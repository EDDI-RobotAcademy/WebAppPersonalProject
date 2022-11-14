import 'dart:convert';

List<Todos> todosFromJson(String str) =>
    List<Todos>.from(jsonDecode(str).map((x) => Todos.fromJson(x)));
String todosToJson(List<Todos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todos{
  final int boardNo;
  final String content;
  late final bool isFinished;

  Todos(
      {required this.boardNo,
        required this.content,
        required this.isFinished});

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      boardNo: json["boardNo"],
      content: json["content"],
      isFinished: json["isFinished"],
    );
  }

  Map<String, dynamic> toJson() => {
    "boardNo" : boardNo,
    "content" : content,
    "isFinished" : isFinished
  };


}

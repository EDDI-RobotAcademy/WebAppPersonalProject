

class TodosInfo {
  final int boardNo;
  final String content;
  final bool isFinished;

  TodosInfo(
      {required this.boardNo,
        required this.content,
        required this.isFinished});

  factory TodosInfo.fromJson(Map<String, dynamic> json) {
    return TodosInfo(
      boardNo: json["boardNo"],
      content: json["content"],
      isFinished: json["isFinished"],
    );
  }
}

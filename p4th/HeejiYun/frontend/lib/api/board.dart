class Board {
  int boardNo;
  String title;
  String writer;
  String content;
  String categoryName;
  String regDate;

  Board({
    required this.boardNo,
    required this.title,
    required this.writer,
    required this.content,
    required this.categoryName,
    required this.regDate
  });

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      boardNo: json["boardNo"] as int,
      title: json["title"] as String,
      writer: json["writer"] as String,
      content: json["content"] as String,
      categoryName: json["categoryName"] as String,
      regDate: json["regDate"] as String,
    );
  }
}
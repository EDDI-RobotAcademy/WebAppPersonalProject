class Board {
  int? boardNo;
  String? title;
  String? writer;
  String? content;
  String? regDate;

  Board({
    this.boardNo,
    this.title,
    this.writer,
    this.content,
    this.regDate
  });

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      boardNo: json["boardNo"] as int,
      title: json["title"] as String,
      writer: json["writer"] as String,
      content: json["writer"] as String,
      regDate: json["regDate"] as String,
    );
  }
}
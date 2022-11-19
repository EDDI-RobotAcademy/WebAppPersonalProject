class Recipe {
  final String title;
  final String nickname;
  final List<String> images;
  final bool like;
  final double rating;
  final String foodCategory;
  final int? boardNo;
  final String content;

  Recipe.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        nickname = map['nickname'],
        images = map['images'],
        like = map['like'],
        rating = map['rating'],
        foodCategory = map['foodCategory'],
        boardNo = map['boardNo'],
        content = map['content'];


  @override
  String toString() => 'Recipe<$title:$foodCategory>';

}

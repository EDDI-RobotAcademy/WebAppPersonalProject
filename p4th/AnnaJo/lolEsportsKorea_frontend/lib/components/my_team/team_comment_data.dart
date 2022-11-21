class TeamCommentData {
  late String myTeam;
  late String nickName;
  late String teamProfile;
  late String contents;
  late String date;


  TeamCommentData({
    required this.myTeam,
    required this.nickName,
    required this.teamProfile,
    required this.contents,
    required this.date,

  });

  factory TeamCommentData.fromJson(Map<String, dynamic> json) {
    return TeamCommentData(
        myTeam: json["myTeam"],
        nickName: json["nickName"],
        teamProfile: json["teamProfile"],
        contents: json["contents"],
        date: json["date"]);
    }
}

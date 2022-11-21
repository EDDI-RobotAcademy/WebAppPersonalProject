class TeamRankingData {
  late String seasonTitle;
  late String ranking;
  late String teamName;
  late String winCount;
  late String loseCount;
  late String goalDifference;
  late String winningRate;
  late String kdaScore;
  late String killCount;
  late String deathCount;
  late String assistCount;

  TeamRankingData({
    required this.seasonTitle,
    required this.ranking,
    required this.teamName,
    required this.winCount,
    required this.loseCount,
    required this.goalDifference,
    required this.winningRate,
    required this.kdaScore,
    required this.killCount,
    required this.deathCount,
    required this.assistCount,
  });

  factory TeamRankingData.fromJson(Map<String, dynamic> json) {
    return TeamRankingData(
        seasonTitle: json["seasonTitle"],
        ranking: json["ranking"],
        teamName: json["teamName"],
        winCount: json["winCount"],
        loseCount: json["loseCount"],
        goalDifference: json["goalDifference"],
        winningRate: json["winningRate"],
        kdaScore: json["kdaScore"],
        killCount: json["killCount"],
        deathCount: json["deathCount"],
        assistCount: json["assistCount"]);
  }
}

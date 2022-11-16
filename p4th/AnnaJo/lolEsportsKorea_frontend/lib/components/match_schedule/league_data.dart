class LeagueData {
  late String leagueTitle;
  late String date;
  late String time;
  late String gameState;
  late String gameTitle;
  late String homeTeam;
  late String homeTeamScore;
  late String awayTeamScore;
  late String awayTeam;

  LeagueData({
    required this.leagueTitle,
    required this.date,
    required this.time,
    required this.gameState,
    required this.gameTitle,
    required this.homeTeam,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.awayTeam,
  });

  LeagueData.fromJson(Map<String, dynamic> json) {
    leagueTitle = json['leagueTitle'];
    date = json['date'];
    time = json['time'];
    gameState = json['gameState'];
    gameTitle = json['gameTitle'];
    homeTeam = json['homeTeam'];
    homeTeamScore = json['homeTeamScore'];
    awayTeamScore = json['awayTeamScore'];
    awayTeam = json['awayTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leagueTitle'] = this.leagueTitle;
    data['date'] = this.date;
    data['time'] = this.time;
    data['gameState'] = this.gameState;
    data['gameTitle'] = this.gameTitle;
    data['homeTeam'] = this.homeTeam;
    data['homeTeamScore'] = this.homeTeamScore;
    data['awayTeamScore'] = this.awayTeamScore;
    data['awayTeam'] = this.awayTeam;
    return data;
  }
}

class MatchScheduleEvent {
  final String? leagueTitle;
  final String? time;
  final String? gameState;
  final String? gameTitle;
  final String? homeTeam;
  final String? homeTeamScore;
  final String? awayTeamScore;
  final String? awayTeam;

  final DateTime? date;

  MatchScheduleEvent(
      {this.leagueTitle,
      this.date,
      this.time,
      this.gameState,
      this.gameTitle,
      this.homeTeam,
      this.homeTeamScore,
      this.awayTeamScore,
      this.awayTeam});

  MatchScheduleEventCopy({
    String? leagueTitle,
    String? time,
    String? gameState,
    String? gameTitle,
    String? homeTeam,
    String? homeTeamScore,
    String? awayTeamScore,
    String? awayTeam,
    DateTime? date,
  }) {
    return MatchScheduleEvent(
      leagueTitle: leagueTitle ?? this.leagueTitle,
      time: leagueTitle ?? this.time,
      gameState: gameState ?? this.gameState,
      gameTitle: gameTitle ?? this.gameTitle,
      homeTeam: homeTeam ?? this.homeTeam,
      homeTeamScore: homeTeamScore ?? this.homeTeamScore,
      awayTeamScore: awayTeamScore ?? this.awayTeamScore,
      awayTeam: awayTeam ?? this.awayTeam,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'leagueTitle': leagueTitle,
      'time': time,
      'gameState': gameState,
      'gameTitle': gameTitle,
      'homeTeam': homeTeam,
      'homeTeamScore': homeTeamScore,
      'awayTeamScore': awayTeamScore,
      'awayTeam': awayTeam,
      'date': date!.millisecondsSinceEpoch,
    };
  }

  factory MatchScheduleEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null!;

    return MatchScheduleEvent(
      leagueTitle: map['leagueTitle'],
      time: map['time'],
      gameState: map['gameState'],
      gameTitle: map['gameTitle'],
      homeTeam: map['homeTeam'],
      homeTeamScore: map['homeTeamScore'],
      awayTeamScore: map['awayTeamScore'],
      awayTeam: map['awayTeam'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }
}

import 'dart:convert';

import '../../components/ranking/team_ranking_data.dart';
import 'package:http/http.dart' as http;

import '../ipInfo.dart';

class RankingApi {
  static Future<List<TeamRankingData>> getTeamRankingInfo(
      String request) async {
    try {
      final teamRankingInfoResponse = await http.get(
        Uri.http(IpInfo.httpUri, '/ranking/$request'),
        headers: {"Content-Type": "application/json"},
      );
      String responseBody = utf8.decode(teamRankingInfoResponse.bodyBytes);
      if (teamRankingInfoResponse.statusCode == 200) {
        List<TeamRankingData> list = parseSchedules(responseBody);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<TeamRankingData> parseSchedules(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed
        .map<TeamRankingData>((json) => TeamRankingData.fromJson(json))
        .toList();
  }
}

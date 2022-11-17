import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../components/match_schedule/league_data.dart';

class LeagueApi {
  static const String httpUri = '192.168.0.8:8888';

  static Future<List<LeagueData>> getLeagueInfo() async {
    try {
      final leagueInfoResponse = await http.get(
        Uri.http(httpUri, '/league/list'),
        headers: {"Content-Type": "application/json"},
      );
      String responseBody = utf8.decode(leagueInfoResponse.bodyBytes);
      if (leagueInfoResponse.statusCode == 200) {
        List<LeagueData> list = parseSchedules(responseBody);
        return list;
      } else {
        // throw로 처리해주어야 null이 반환되지 않도록 함 -> 메서드가 null을 허용하지 않는 메서드임
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<LeagueData> parseSchedules(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed.map<LeagueData>((json) => LeagueData.fromJson(json)).toList();
  }
}

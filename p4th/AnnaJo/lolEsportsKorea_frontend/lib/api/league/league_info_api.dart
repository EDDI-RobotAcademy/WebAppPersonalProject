import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
      if (leagueInfoResponse.statusCode == 200) {
        List<LeagueData> list =
            parseSchedules(utf8.decode(leagueInfoResponse.bodyBytes));
        return list;
      } else {
        // throw로 처리해주어야 null이 반환되지 않도록 함 -> 메서드가 null을 허용하지 않는 메서드임
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString() + "무슨 에러인가");
    }
  }

  static List<LeagueData> parseSchedules(String responseBody) {
    final parsed = json.decode(responseBody);

    // 여기 들어갈때 타입 에러
    return parsed["LeagueData"]
        .map<LeagueData>((json) => LeagueData.fromJson(json))
        .toList();
  }
}

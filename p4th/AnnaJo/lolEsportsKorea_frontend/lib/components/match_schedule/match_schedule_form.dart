import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../api/league/league_info_api.dart';
import 'match_schedule_event.dart';
import 'dart:async';

bool load = false;
List<MatchScheduleEvent> events = [];

class MatchScheduleForm extends StatefulWidget {
  const MatchScheduleForm({Key? key}) : super(key: key);

  @override
  State<MatchScheduleForm> createState() => _MatchScheduleFormState();
}

class _MatchScheduleFormState extends State<MatchScheduleForm>
    with TickerProviderStateMixin {
  _MatchScheduleFormState();

  CalendarFormat _calendarFormat = CalendarFormat.week; // 기본 week로 설정
  LinkedHashMap<DateTime, List<MatchScheduleEvent>>? _groupedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    addMatchSchedules();
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  /// 날짜에 맞게 가지고 있는 경기 정보 그룹화
  _recordMatchScheduleEvents(List<MatchScheduleEvent> events) {
    _groupedEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    for (var event in events) {
      DateTime date = DateTime.utc(
          event.date!.year, event.date!.month, event.date!.day, 12);
      if (_groupedEvents![date] == null) _groupedEvents![date] = [];
      _groupedEvents![date]!.add(event);
    }
  }

  List<dynamic> _getEventsForDay(DateTime date) {
    return _groupedEvents![date] ?? [];
  }

  Future addMatchSchedules() async {
    await LeagueApi.getLeagueInfo().then((schedules) {
      events.clear();
      for (var i = 0; i < schedules.length; i++) {
        events.add(MatchScheduleEvent(
            leagueTitle: schedules[i].leagueTitle,
            date: DateTime.parse(schedules[i].date),
            time: schedules[i].time,
            gameState: schedules[i].gameState,
            gameTitle: schedules[i].gameTitle,
            homeTeam: schedules[i].homeTeam,
            homeTeamScore: schedules[i].homeTeamScore,
            awayTeamScore: schedules[i].awayTeamScore,
            awayTeam: schedules[i].awayTeam));
      }
      setState(() {
        load = true;
      });
    });
    await _recordMatchScheduleEvents(events);
  }

  @override
  Widget build(BuildContext context) {
    if (load == false) {
      return const Padding(
        padding: EdgeInsets.all(100),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        ),
      );
    } else {
      return Column(
        children: <Widget>[
          TableCalendar(
            firstDay: DateTime.utc(2011, 01, 01),
            lastDay: DateTime.utc(2032, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 16.0),
          SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              children: [
                ..._getEventsForDay(_selectedDay).map(
                  (event) => Card(
                    color: Theme.of(context).colorScheme.outline,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ListTile(
                      title: Text(
                        event.leagueTitle.toString() +
                            " (" +
                            event.gameTitle.toString() +
                            ") ",
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      subtitle: Text(
                        event.time.toString() +
                            " " +
                            event.gameState.toString() +
                            " \n " +
                            event.homeTeam.toString() +
                            " " +
                            event.homeTeamScore.toString() +
                            " : " +
                            event.awayTeamScore.toString() +
                            " " +
                            event.awayTeam.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}

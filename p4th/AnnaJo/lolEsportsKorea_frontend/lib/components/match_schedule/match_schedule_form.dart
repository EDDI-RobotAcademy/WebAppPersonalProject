import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../api/league/league_info_api.dart';
import 'match_schedule_event.dart';

class MatchScheduleForm extends StatefulWidget {

  const MatchScheduleForm({Key? key}) : super(key: key);

  @override
  State<MatchScheduleForm> createState() => _MatchScheduleFormState();
}

class _MatchScheduleFormState extends State<MatchScheduleForm> {
  CalendarFormat _calendarFormat = CalendarFormat.week; // 기본 week로 설정
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool load = false;
  List<MatchScheduleEvent> events = [];

  LinkedHashMap<DateTime, List<MatchScheduleEvent>>? _groupedEvents;

  @override
  void initState(){
    addSchedules();
  }

  List<dynamic> _getEventsForDay(DateTime date){
    return _groupedEvents?[date] ?? [];
  }

  Future addSchedules() async{
    await LeagueApi.getLeagueInfo().then((schedules){
      for (var i = 0; i < schedules.length; i++){
        events.add(MatchScheduleEvent(
          date: DateTime.parse(schedules[i].date),
          title: schedules[i].leagueTitle));
      }
      setState(() {
        load = true;
      });
    });
    _groupEvents(events);
  }

  int getHashCode(DateTime key){
    return key.day * 1000000 + key.month * 10002 + key.year;
  }

  _groupEvents(List<MatchScheduleEvent> events){
    _groupedEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    for(var event in events) {
      DateTime date = DateTime.utc(event.date!.year, event.date!.month, event.date!.day, 12);
      if(_groupedEvents![date] == null) _groupedEvents![date] = [];
      _groupedEvents![date]!.add(event);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          eventLoader: _getEventsForDay,
          firstDay: DateTime.utc(2011, 01, 01),
          lastDay: DateTime.utc(2032, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
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
      ],
    );
  }
}



class MatchScheduleEvent{
  final String? title;
  final DateTime? date;

  MatchScheduleEvent({
    this.title,
    this.date,
});

  MatchScheduleEventCopy({
    String? title,
    DateTime? date,
}) {
    return MatchScheduleEvent(
      title: title ?? this.title,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'title' : title,
      'date' : date!.millisecondsSinceEpoch,
    };
  }

  factory MatchScheduleEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null!;

    return MatchScheduleEvent(
      title: map['title'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }
}
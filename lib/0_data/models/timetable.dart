import 'dart:convert';

import 'period.dart';

class Timetable {
  final Map<String, List<Period>> scheduleMap;

  Timetable(this.scheduleMap);

  factory Timetable.fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);

    Map<String, List<Period>> scheduleMap = {};

    data.forEach((day, periodsListData) {
      List<dynamic> periodsList = periodsListData;
      List<Period> periods =
          periodsList.map((periodData) => Period.fromMap(periodData)).toList();
      scheduleMap[day] = periods;
    });
    return Timetable(scheduleMap);
  }

  @override
  String toString() {
    return scheduleMap.toString();
  }
}

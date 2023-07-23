import 'dart:convert';

import 'package:vtop_app/0_data/models/period.dart';

Map<String, List<Period>> parseTimetableAllDays(String json) {
  final Map<String, dynamic> data = jsonDecode(json);

  Map<String, List<Period>> timetable = {};

  data.forEach((day, periodsList) {
    List<Period> periods = (periodsList as List<dynamic>)
        .map((periodData) => Period.fromMap(periodData))
        .toList();
    timetable[day] = periods;
  });
  return timetable;
}

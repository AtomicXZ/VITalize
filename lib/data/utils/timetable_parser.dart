import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/models/periods.dart';

Map<String, Periods> parseTimetableAllDays(Map<String, dynamic> data) {
  Map<String, Periods> timetable = {};

  data.forEach((day, periodsList) {
    Periods periods = Periods((periodsList as List<dynamic>)
        .map((periodData) => Period.fromMap(periodData))
        .toList());
    timetable[day] = periods;
  });
  return timetable;
}

import 'package:vitalize/data/models/attendance.dart';

Map<String, Attendance> parseAttendance(List<dynamic> data) {
  Map<String, Attendance> attendance = {};

  for (var entry in data) {
    String slot = entry['slot'] as String;
    attendance[slot] = Attendance.fromMap(Map<String, String>.from(entry));
  }
  return attendance;
}

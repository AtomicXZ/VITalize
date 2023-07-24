import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtop_app/0_data/models/attendance.dart';

import '../constants.dart';
import '../utils/timetable_parser.dart';
import '../models/period.dart';

class APIRepository {
  Future<Map<String, List<Period>>> getTimetable(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(timetableURL),
        body: {'username': username, 'password': password});
    if (resp.statusCode == 200) {
      Map<String, List<Period>> timetable = parseTimetableAllDays(resp.body);
      return timetable;
    } else {
      return {};
    }
  }

  Future<Map<String, String>> getProfile(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(profileURL),
        body: {'username': username, 'password': password});
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body) as Map<String, dynamic>;
      Map<String, String> profile = {};
      data.forEach((key, value) => profile[key] = value.toString());
      return profile;
    } else {
      return {};
    }
  }

  Future<Map<String, Attendance>> getAttendance(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(attendanceURL),
        body: {'username': username, 'password': password});
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body) as List<dynamic>;
      Map<String, Attendance> attendance = {};

      for (var entry in data) {
        String slot = entry['slot'] as String;
        attendance[slot] = Attendance.fromMap(Map<String, String>.from(entry));
      }
      return attendance;
    } else {
      return {};
    }
  }
}

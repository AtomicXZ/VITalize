import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtop_app/0_data/models/attendance.dart';
import 'package:vtop_app/0_data/utils/attendance_parser.dart';
import 'package:vtop_app/0_data/utils/profile_parser.dart';

import '../constants.dart';
import '../utils/timetable_parser.dart';
import '../models/period.dart';

class APIRepository {
  Future<Map<String, List<Period>>> getTimetable(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(timetableURL),
        body: {'username': username, 'password': password});
    if (resp.statusCode == 200) {
      Map<String, List<Period>> timetable =
          parseTimetableAllDays(jsonDecode(resp.body));
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
      return parseProfile(jsonDecode(resp.body));
    } else {
      return {};
    }
  }

  Future<Map<String, Attendance>> getAttendance(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(attendanceURL),
        body: {'username': username, 'password': password});
    if (resp.statusCode == 200) {
      return parseAttendance(jsonDecode(resp.body));
    } else {
      return {};
    }
  }

  Future<Map<String, Map<String, dynamic>>> getAll(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(allURL),
        body: {'username': username, 'password': password});
    var body = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
      Map<String, Map<String, dynamic>> all = {};
      all['timetable'] = parseTimetableAllDays(body['timetable']);
      all['profile'] = parseProfile(body['profile']);
      all['attendance'] = parseAttendance(body['attendance']);
      return all;
    } else {
      return {};
    }
  }
}

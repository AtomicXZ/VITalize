import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/models/attendance.dart';
import 'package:vitalize/data/models/marks.dart';
import 'package:vitalize/data/models/periods.dart';
import 'package:vitalize/data/utils/attendance_parser.dart';
import 'package:vitalize/data/utils/marks_parser.dart';
import 'package:vitalize/data/utils/profile_parser.dart';
import 'package:vitalize/data/utils/sem_id_parser.dart';
import 'package:vitalize/data/utils/timetable_parser.dart';

class APIRepository {
  Future<Map<String, Periods>> getTimetable(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(timetableURL),
        body: getPostBody(username, password));
    if (resp.statusCode == 200) {
      Map<String, Periods> timetable =
          parseTimetableAllDays(jsonDecode(resp.body));
      return timetable;
    } else {
      return {};
    }
  }

  Future<Map<String, String>> getProfile(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(profileURL),
        body: getPostBody(username, password));
    if (resp.statusCode == 200) {
      return parseProfile(jsonDecode(resp.body));
    } else {
      return {};
    }
  }

  Future<Map<String, Attendance>> getAttendance(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(attendanceURL),
        body: getPostBody(username, password));
    if (resp.statusCode == 200) {
      return parseAttendance(jsonDecode(resp.body));
    } else {
      return {};
    }
  }

  Future<Map<String, String>> getSemIDs(
      String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(semIDsURL),
        body: getPostBody(username, password));
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      return {};
    }
  }

  Future<Map<String, Marks>> getMarks(
      String username, String password, String semID) async {
    Map<String, String> body = getPostBody(username, password);
    body['semID'] = semID;
    final http.Response resp = await http.post(Uri.parse(marksURL), body: body);
    if (resp.statusCode == 200) {
      return parseMarks(jsonDecode(resp.body));
    } else {
      return {};
    }
  }

  Future<Map> getGrades(String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(gradesURL),
        body: getPostBody(username, password));
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      return {};
    }
  }

  Future<Map> getExamSchedule(String username, String password) async {
    final http.Response resp = await http.post(Uri.parse(examScheduleURL),
        body: getPostBody(username, password));
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
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
      all['semIDs'] = parseSemID(body['semIDs']);
      all['grades'] = body['grades'];
      all['examSchedule'] = body['examSchedule'];
      return all;
    } else {
      return {};
    }
  }
}

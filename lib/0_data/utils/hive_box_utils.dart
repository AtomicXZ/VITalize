import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:vtop_app/0_data/constants.dart';
import 'package:vtop_app/0_data/models/attendance.dart';
import 'package:vtop_app/0_data/models/period.dart';

const String timetableBoxName = 'timetableBox';
const String attendanceBoxName = 'attendanceBox';
const String profileBoxName = 'profileBox';

Future<bool> get serverAvailable async {
  try {
    if ((await http.get(Uri.parse(baseURL))).statusCode == 200) {
      return true;
    }
  } on SocketException {
    return false;
  }
  return false;
}

Map<dynamic, String> get getCreds {
  Box<String> userBox = Hive.box('userBox');
  Map<dynamic, String> userMap = userBox.toMap();
  return userMap;
}

void emptyAllBoxes() {
  Box<String> profileBox = Hive.box<String>(profileBoxName);
  Box<List<Period>> timetableBox = Hive.box<List<Period>>(timetableBoxName);
  Box<Attendance> attendanceBox = Hive.box<Attendance>(attendanceBoxName);
  Box<String> userBox = Hive.box('userBox');

  profileBox.clear();
  timetableBox.clear();
  attendanceBox.clear();
  userBox.clear();
}

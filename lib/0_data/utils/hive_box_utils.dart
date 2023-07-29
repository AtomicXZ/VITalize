import 'dart:async';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:vtop_app/0_data/constants.dart';
import 'package:vtop_app/0_data/models/attendance.dart';
import 'package:vtop_app/0_data/models/period.dart';
import 'package:vtop_app/0_data/models/periods.dart';

Future<bool> get serverAvailable async {
  try {
    if ((await http.get(Uri.parse(baseURL)).timeout(const Duration(seconds: 3)))
            .statusCode ==
        200) {
      return true;
    }
  } on TimeoutException {
    return false;
  } on SocketException {
    return false;
  }
  return false;
}

Map<dynamic, String> get getCreds {
  Box<String> userBox = Hive.box(userBoxName);
  Map<dynamic, String> userMap = userBox.toMap();
  return userMap;
}

Future<void> openAllBoxes() async {
  await Hive.openBox<String>(userBoxName);
  await Hive.openBox<String>(profileBoxName);
  await Hive.openBox<Periods>(timetableBoxName);
  await Hive.openBox<Attendance>(attendanceBoxName);
  await Hive.openBox<String>(semIDsBoxName);
}

void registerAllAdapters() {
  Hive.registerAdapter(PeriodAdapter());
  Hive.registerAdapter(PeriodsAdapter());
  Hive.registerAdapter(AttendanceAdapter());
}

void emptyAllBoxes() {
  Box<String> profileBox = Hive.box<String>(profileBoxName);
  Box<Periods> timetableBox = Hive.box<Periods>(timetableBoxName);
  Box<Attendance> attendanceBox = Hive.box<Attendance>(attendanceBoxName);
  Box<String> semIDsBox = Hive.box<String>(semIDsBoxName);
  Box<String> userBox = Hive.box(userBoxName);

  profileBox.clear();
  timetableBox.clear();
  attendanceBox.clear();
  userBox.clear();
  semIDsBox.clear();
}

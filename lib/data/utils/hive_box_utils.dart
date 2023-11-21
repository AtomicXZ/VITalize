import 'dart:async';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/models/attendance.dart';
import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/models/periods.dart';

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
  return {'username': userMap['username']!, 'password': userMap['password']!};
}

Future<void> openUserBox() async {
  await Hive.openBox<String>(userBoxName);
}

Future<void> openAllBoxesExceptUser() async {
  await Hive.openBox<String>(profileBoxName);
  await Hive.openBox<Periods>(timetableBoxName);
  await Hive.openBox<Attendance>(attendanceBoxName);
  await Hive.openBox<String>(semIDsBoxName);
  await Hive.openBox(gradesBoxName);
  await Hive.openBox(examScheduleBoxName);
}

Future<void> openAllBoxes() async {
  await openUserBox();
  await openAllBoxesExceptUser();
}

void registerAllAdapters() {
  Hive.registerAdapter(PeriodAdapter());
  Hive.registerAdapter(PeriodsAdapter());
  Hive.registerAdapter(AttendanceAdapter());
}

void deleteAllBoxesExceptUser() {
  Hive.deleteBoxFromDisk(profileBoxName);
  Hive.deleteBoxFromDisk(timetableBoxName);
  Hive.deleteBoxFromDisk(attendanceBoxName);
  Hive.deleteBoxFromDisk(semIDsBoxName);
  Hive.deleteBoxFromDisk(gradesBoxName);
  Hive.deleteBoxFromDisk(examScheduleBoxName);
}

Future<void> emptyAllBoxesExceptUser() async {
  Box<String> profileBox = Hive.box<String>(profileBoxName);
  Box<Periods> timetableBox = Hive.box<Periods>(timetableBoxName);
  Box<Attendance> attendanceBox = Hive.box<Attendance>(attendanceBoxName);
  Box<String> semIDsBox = Hive.box<String>(semIDsBoxName);
  Box gradesBox = Hive.box(gradesBoxName);
  Box examScheduleBox = Hive.box(examScheduleBoxName);

  await profileBox.clear();
  await timetableBox.clear();
  await attendanceBox.clear();
  await gradesBox.clear();
  await semIDsBox.clear();
  await examScheduleBox.clear();
}

void emptyAllBoxes() {
  emptyAllBoxesExceptUser();
  Box<String> userBox = Hive.box(userBoxName);
  userBox.clear();
}

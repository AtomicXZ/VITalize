import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:vtop_app/0_data/constants.dart';
import 'package:vtop_app/0_data/models/attendance.dart';
import 'package:vtop_app/0_data/models/periods.dart';
import 'package:vtop_app/0_data/utils/hive_box_utils.dart';
import 'package:vtop_app/0_data/repositories/api_repository.dart';

class HiveAllRepository {
  APIRepository apiRepository = APIRepository();
  Future<void> get getAllFromApiAndCache async {
    Box<String> profileBox = Hive.box<String>(profileBoxName);
    Box<Periods> timetableBox = Hive.box<Periods>(timetableBoxName);
    Box<Attendance> attendanceBox = Hive.box<Attendance>(attendanceBoxName);
    Box<String> semIDsBox = Hive.box<String>(semIDsBoxName);

    try {
      if (await serverAvailable) {
        Map<dynamic, String> user = getCreds;
        Map<String, Map<String, dynamic>> all =
            await apiRepository.getAll(user['username']!, user['password']!);
        if (all.isNotEmpty) {
          profileBox.putAll(all['profile']! as Map<String, String>);
          timetableBox.putAll(all['timetable']! as Map<String, Periods>);
          attendanceBox.putAll(all['attendance']! as Map<String, Attendance>);
          semIDsBox.putAll(all['semIDs']! as Map<String, String>);
        }
      }
    } on SocketException {
      // ignore for now and just move on, data will be fetched again if no data is available
    }
  }
}

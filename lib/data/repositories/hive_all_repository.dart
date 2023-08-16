import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/models/attendance.dart';
import 'package:vitalize/data/models/periods.dart';
import 'package:vitalize/data/repositories/api_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class HiveAllRepository {
  APIRepository apiRepository = APIRepository();

  Future<void> get getAllFromApiAndCache async {
    Box<String> profileBox = Hive.box<String>(profileBoxName);
    Box<Periods> timetableBox = Hive.box<Periods>(timetableBoxName);
    Box<Attendance> attendanceBox = Hive.box<Attendance>(attendanceBoxName);
    Box<String> semIDsBox = Hive.box<String>(semIDsBoxName);
    Box gradesBox = Hive.box(gradesBoxName);
    Box examScheduleBox = Hive.box(examScheduleBoxName);

    try {
      if (await serverAvailable) {
        Map<String, Map<String, dynamic>> all = await apiRepository.getAll;
        if (all.isNotEmpty) {
          await emptyAllBoxesExceptUser();
          profileBox.putAll(all['profile']! as Map<String, String>);
          timetableBox.putAll(all['timetable']! as Map<String, Periods>);
          attendanceBox.putAll(all['attendance']! as Map<String, Attendance>);
          semIDsBox.putAll(all['semIDs']! as Map<String, String>);
          gradesBox.putAll(all['grades']!);
          examScheduleBox.putAll(all['examSchedule']!);
        }
      }
    } on SocketException {
      // ignore for now and just move on, data will be fetched again if no data is available
    }
  }
}

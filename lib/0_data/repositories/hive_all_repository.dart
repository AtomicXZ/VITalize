import 'package:hive_flutter/hive_flutter.dart';

import 'package:vtop_app/0_data/constants.dart';
import 'package:vtop_app/0_data/models/attendance.dart';
import 'package:vtop_app/0_data/models/periods.dart';
import 'package:vtop_app/0_data/utils/hive_box_utils.dart';
import 'package:vtop_app/0_data/repositories/api_repository.dart';

class HiveAllRepository {
  APIRepository apiRepository = APIRepository();
  Future<void> get getAllFromApiAndCache async {
    Box<String> profileBox = await Hive.openBox<String>(profileBoxName);
    Box<Periods> timetableBox = await Hive.openBox<Periods>(timetableBoxName);
    Box<Attendance> attendanceBox =
        await Hive.openBox<Attendance>(attendanceBoxName);
    Box<String> semIDsBox = await Hive.openBox<String>(semIDsBoxName);

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
  }
}

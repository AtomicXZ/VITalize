import 'package:hive_flutter/hive_flutter.dart';

import '../models/attendance.dart';
import '../models/period.dart';
import '../utils/hive_box_utils.dart';
import 'api_repository.dart';

class HiveAllRepository {
  APIRepository apiRepository = APIRepository();
  String timetableBoxName = 'timetableBox';
  String attendanceBoxBoxName = 'attendanceBoxBox';
  String profileBoxName = 'profileBox';

  Future<void> get getAllFromApiAndCache async {
    Box<String> profileBox = await Hive.openBox<String>(profileBoxName);
    Box<List<Period>> timetableBox =
        await Hive.openBox<List<Period>>(timetableBoxName);
    Box<Attendance> attendanceBox =
        await Hive.openBox<Attendance>(attendanceBoxBoxName);

    if (await serverAvailable) {
      Map<dynamic, String> user = getCreds;
      Map<String, Map<String, dynamic>> all =
          await apiRepository.getAll(user['username']!, user['password']!);
      if (all.isNotEmpty) {
        profileBox.putAll(all['profile']! as Map<String, String>);
        timetableBox.putAll(all['timetable']! as Map<String, List<Period>>);
        attendanceBox.putAll(all['attendance']! as Map<String, Attendance>);
      }
    }
  }
}

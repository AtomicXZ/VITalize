import 'package:vtop_app/0_data/repositories/hive_attendance_repository.dart';
import 'package:vtop_app/0_data/repositories/hive_profile_repository.dart';
import 'package:vtop_app/0_data/repositories/hive_timetable_repository.dart';

Future<void> cacheAllData() async {
  await HiveTimetableRepository().getTimetableFromApiAndCache;
  await HiveProfileRepository().getProfileFromApiAndCache;
  await HiveAttendanceRepository().getAttendanceFromApiAndCache;
}

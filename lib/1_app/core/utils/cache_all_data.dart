import 'package:vtop_app/0_data/repositories/hive_profile_repository.dart';
import 'package:vtop_app/0_data/repositories/hive_timetable_repository.dart';

void cacheAllData() async {
  await HiveTimetableRepository().getTimetableFromApiAndCache;
  await HiveProfileRepository().getProfileFromApiAndCache;
}

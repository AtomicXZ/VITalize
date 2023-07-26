import 'package:vtop_app/0_data/models/period.dart';
import 'package:vtop_app/0_data/repositories/hive_timetable_repository.dart';
import 'package:vtop_app/1_app/core/utils/time_utils.dart';

HiveTimetableRepository repository = HiveTimetableRepository();

Future<List<Period>> getTodaysPeriods() async {
  if (todayAsWord != 'Holiday') {
    return (await repository.getTimetableFromBox)[todayAsWord]!.periods;
  } else {
    return [];
  }
}

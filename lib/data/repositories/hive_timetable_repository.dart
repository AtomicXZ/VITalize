import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/models/periods.dart';
import 'package:vitalize/data/repositories/api_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';
import 'package:vitalize/app/core/utils/time_utils.dart';

class HiveTimetableRepository {
  APIRepository apiRepository = APIRepository();

  Future<Map<dynamic, Periods>> get getTimetableFromApiAndCache async {
    Box<Periods> box = Hive.box<Periods>(timetableBoxName);

    if (await serverAvailable) {
      Map<String, Periods> timetable = await apiRepository.getTimetable;
      if (timetable.isNotEmpty) {
        box.putAll(timetable);
        return timetable;
      }
    }
    Map<dynamic, Periods> timetable = box.toMap();
    return timetable;
  }

  Future<Map<dynamic, Periods>> get getTimetableFromBox async {
    Box<Periods> timetableBox = Hive.box(timetableBoxName);

    if (timetableBox.isEmpty) {
      return getTimetableFromApiAndCache;
    }

    return timetableBox.toMap();
  }

  Future<List<Period>> getTodaysPeriods() async {
    if (todayAsWord != 'Holiday') {
      return (await getTimetableFromBox)[todayAsWord]!.periods;
    } else {
      return [];
    }
  }
}

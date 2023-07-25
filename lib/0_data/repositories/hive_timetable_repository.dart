import 'package:hive_flutter/hive_flutter.dart';

import '../models/period.dart';
import '../utils/hive_box_utils.dart';
import 'api_repository.dart';

class HiveTimetableRepository {
  APIRepository apiRepository = APIRepository();
  String timetableBoxName = 'timetableBox';

  Future<Map<dynamic, List<Period>>> get getTimetableFromApiAndCache async {
    Box<List<Period>> box = Hive.box<List<Period>>(timetableBoxName);

    if (await serverAvailable) {
      Map<dynamic, String> user = getCreds;

      Map<String, List<Period>> timetable = await apiRepository.getTimetable(
          user['username']!, user['password']!);
      if (timetable.isNotEmpty) {
        box.putAll(timetable);
        return timetable;
      }
    }
    Map<dynamic, List<Period>> timetable = box.toMap();
    return timetable;
  }

  Future<Map<dynamic, List<Period>>> get getTimetableFromBox async {
    Box<List<Period>> timetableBox = Hive.box(timetableBoxName);

    if (timetableBox.isEmpty) {
      return getTimetableFromApiAndCache;
    }

    return timetableBox.toMap();
  }
}

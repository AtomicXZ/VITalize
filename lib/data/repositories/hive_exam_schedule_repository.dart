import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/repositories/api_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class HiveExamScheduleRepository {
  APIRepository apiRepository = APIRepository();

  Future<Map> get getExamScheduleFromApiAndCache async {
    Box box = Hive.box(examScheduleBoxName);

    if (await serverAvailable) {
      Map examSchedule = await apiRepository.getExamSchedule;
      if (examSchedule.isNotEmpty) {
        box.putAll(examSchedule);
        return examSchedule;
      }
    }
    Map examSchedule = box.toMap();
    return examSchedule;
  }

  Future<Map> get getExamScheduleFromBox async {
    Box examScheduleBox = Hive.box(examScheduleBoxName);
    Box<String> userBox = Hive.box(userBoxName);
    String day = DateTime.now().day.toString();

    if (examScheduleBox.isEmpty ||
        userBox.get('examScheduleLastUpdated') != day) {
      userBox.put('examScheduleLastUpdated', day);
      return getExamScheduleFromApiAndCache;
    }

    return examScheduleBox.toMap();
  }
}

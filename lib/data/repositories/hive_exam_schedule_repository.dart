import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/models/response.dart';
import 'package:vitalize/data/repositories/api_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class HiveExamScheduleRepository {
  APIRepository apiRepository = APIRepository();

  Future<Response<Map>> get getExamScheduleFromApiAndCache async {
    Box box = Hive.box(examScheduleBoxName);

    if (await serverAvailable) {
      Response<Map> examSchedule = await apiRepository.getExamSchedule;
      if (Response.responseStatus(examSchedule.status)) {
        box.putAll(examSchedule.response);
        return Response(examSchedule.response, ResponseStatus.success);
      }
    }
    Map examSchedule = box.toMap();
    return Response(examSchedule, ResponseStatus.failure);
  }

  Future<Response<Map>> get getExamScheduleFromBox async {
    Box examScheduleBox = Hive.box(examScheduleBoxName);
    Box<String> userBox = Hive.box(userBoxName);
    String day = DateTime.now().day.toString();

    if (examScheduleBox.isEmpty ||
        (userBox.get(examScheduleLastUpdated) != day &&
            userBox.get(allDataLastUpdated) != day)) {
      userBox.put(examScheduleLastUpdated, day);
      return getExamScheduleFromApiAndCache;
    }

    return Response(examScheduleBox.toMap(), ResponseStatus.fromBox);
  }
}

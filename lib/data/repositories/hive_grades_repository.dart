import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/repositories/api_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class HiveGradesRepository {
  APIRepository apiRepository = APIRepository();

  Future<Map> get getGradesFromApiAndCache async {
    Box box = Hive.box(gradesBoxName);

    if (await serverAvailable) {
      Map<dynamic, String> user = getCreds;

      Map grades =
          await apiRepository.getGrades(user['username']!, user['password']!);
      if (grades.isNotEmpty) {
        box.putAll(grades);
        return grades;
      }
    }
    Map grades = box.toMap();
    return grades;
  }

  Future<Map> get getGradesFromBox async {
    Box gradesBox = Hive.box(gradesBoxName);
    Box<String> userBox = Hive.box(userBoxName);
    String day = DateTime.now().day.toString();

    if (gradesBox.isEmpty || userBox.get('gradesLastUpdated') != day) {
      userBox.put('gradesLastUpdated', day);
      return getGradesFromApiAndCache;
    }

    return gradesBox.toMap();
  }
}

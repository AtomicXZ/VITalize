import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/repositories/api_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class HiveSemIDsRepository {
  APIRepository apiRepository = APIRepository();

  Future<Map<dynamic, String>> get getSemIDsFromApiAndCache async {
    Box<String> box = Hive.box<String>(semIDsBoxName);

    if (await serverAvailable) {
      Map<dynamic, String> user = getCreds;

      Map<String, String> semIDs =
          await apiRepository.getSemIDs(user['username']!, user['password']!);
      if (semIDs.isNotEmpty) {
        box.putAll(semIDs);
        return semIDs;
      }
    }
    Map<dynamic, String> semIDs = box.toMap();
    return semIDs;
  }

  Future<Map<dynamic, String>> get getSemIDsFromBox async {
    Box<String> semIDsBox = Hive.box(semIDsBoxName);

    if (semIDsBox.isEmpty) {
      return getSemIDsFromApiAndCache;
    }

    return semIDsBox.toMap();
  }
}

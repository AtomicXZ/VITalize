import 'package:hive_flutter/hive_flutter.dart';

import 'package:vtop_app/0_data/utils/hive_box_utils.dart';
import 'package:vtop_app/0_data/repositories/api_repository.dart';

class HiveProfileRepository {
  APIRepository apiRepository = APIRepository();
  String profileBoxName = 'profileBox';

  Future<Map<dynamic, String>> get getProfileFromApiAndCache async {
    Box<String> box = Hive.box<String>(profileBoxName);

    if (await serverAvailable) {
      Map<dynamic, String> user = getCreds;

      Map<String, String> profile =
          await apiRepository.getProfile(user['username']!, user['password']!);
      if (profile.isNotEmpty) {
        box.putAll(profile);
        return profile;
      }
    }
    Map<dynamic, String> profile = box.toMap();
    return profile;
  }

  Future<Map<dynamic, String>> get getProfileFromBox async {
    Box<String> profileBox = Hive.box(profileBoxName);

    if (profileBox.isEmpty) {
      return getProfileFromApiAndCache;
    }

    return profileBox.toMap();
  }
}

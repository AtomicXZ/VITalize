import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/app/core/utils/time_utils.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/repositories/hive_all_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

Future<void> cacheAllData() async {
  emptyAllBoxesExceptUser();
  Box<String> userBox = Hive.box(userBoxName);
  await HiveAllRepository().getAllFromApiAndCache;
  userBox.put(allDataLastUpdated, getTodaysDate);
}

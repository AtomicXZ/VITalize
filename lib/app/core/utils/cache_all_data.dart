import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/app/core/utils/time_utils.dart';
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/repositories/hive_all_repository.dart';

Future<void> cacheAllData() async {
  Box<String> userBox = Hive.box(userBoxName);
  await HiveAllRepository().getAllFromApiAndCache;
  userBox.put(allDataLastUpdated, getTodaysDate);
}

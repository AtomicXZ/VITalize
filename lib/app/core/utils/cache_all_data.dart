import 'package:vitalize/data/repositories/hive_all_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

Future<void> cacheAllData() async {
  emptyAllBoxesExceptUser();
  await HiveAllRepository().getAllFromApiAndCache;
}

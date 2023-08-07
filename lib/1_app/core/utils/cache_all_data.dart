import 'package:vtop_app/0_data/repositories/hive_all_repository.dart';
import 'package:vtop_app/0_data/utils/hive_box_utils.dart';

Future<void> cacheAllData() async {
  emptyAllBoxesExceptUser();
  await HiveAllRepository().getAllFromApiAndCache;
}

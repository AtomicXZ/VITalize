import 'package:vtop_app/0_data/repositories/hive_all_repository.dart';

Future<void> cacheAllData() async {
  await HiveAllRepository().getAllFromApiAndCache;
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

// hive user keys - for settings
const String dynamicTheme = 'dynamicTheme';
const String firstLaunch = 'isFirstLaunch';
const String themeColor = 'themeColor';
const String reminderTime = 'reminderTime';
const String version = 'version';

const List<String> listenableKeys = [dynamicTheme, themeColor];

bool isTrue(String field) {
  Box<String> userBox = Hive.box('userBox');

  return userBox.get(field) != 'false';
}

String? getString(String field) {
  Box<String> userBox = Hive.box('userBox');

  return userBox.get(field);
}

void setKeyValue(String field, dynamic value) {
  Box<String> userBox = Hive.box('userBox');

  userBox.put(field, value.toString());
}

bool get isNewVersion {
  Box<String> userBox = Hive.box('userBox');

  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    return userBox.get(version) !=
        '${packageInfo.version}+${packageInfo.buildNumber}';
  });
  return false;
}

Future<void> get hiveStartUp async {
  registerAllAdapters();
  await openUserBox();
  if (isNewVersion) {
    deleteAllBoxesExceptUser();
  }
  await openAllBoxesExceptUser();
}

import 'package:hive_flutter/hive_flutter.dart';

// hive user keys - for settings
const String dynamicTheme = 'dynamicTheme';
const String firstLaunch = 'isFirstLaunch';

const List<String> listenableKeys = [dynamicTheme];

bool isTrue(String field) {
  Box<String> userBox = Hive.box('userBox');

  return userBox.get(field) != 'false';
}

void setKeyValue(String field, bool value) {
  Box<String> userBox = Hive.box('userBox');

  userBox.put(field, value.toString());
}

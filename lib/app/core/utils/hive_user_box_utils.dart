import 'package:hive_flutter/hive_flutter.dart';

// hive user keys - for settings
const String dynamicTheme = 'dynamicTheme';
const String firstLaunch = 'isFirstLaunch';
const String themeColor = 'themeColor';

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

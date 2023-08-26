import 'package:hive_flutter/hive_flutter.dart';

bool get isFirstLaunch {
  Box<String> userBox = Hive.box('userBox');

  return userBox.get('isFirstLaunch') != 'false';
}

bool isTrue(String field) {
  Box<String> userBox = Hive.box('userBox');

  return userBox.get(field) != 'false';
}

void setKeyValue(String field, bool value) {
  Box<String> userBox = Hive.box('userBox');

  userBox.put(field, value.toString());
}

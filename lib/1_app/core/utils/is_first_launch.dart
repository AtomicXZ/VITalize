import 'package:hive_flutter/hive_flutter.dart';

bool get isFirstLaunch {
  Box<String> userBox = Hive.box('userBox');

  return userBox.get('isFirstLaunch') != 'false';
}

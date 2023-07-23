import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:vtop_app/0_data/constants.dart';

Future<bool> get serverAvailable async {
  try {
    if ((await http.get(Uri.parse(baseURL))).statusCode == 200) {
      return true;
    }
  } on SocketException {
    return false;
  }
  return false;
}

Map<dynamic, String> get getCreds {
  Box<String> userBox = Hive.box('userBox');
  Map<dynamic, String> userMap = userBox.toMap();
  return userMap;
}

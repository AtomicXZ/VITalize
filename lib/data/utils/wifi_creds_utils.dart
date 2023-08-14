import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:vitalize/data/constants.dart';

void saveWifiPassword(String password) {
  Box<String> userBox = Hive.box(userBoxName);
  userBox.put('wifiPassword', password);
}

Future<int> loginSophosClient() async {
  // returns integer codes for different outcomes
  // -1 = no password in box
  // 0 = success
  // 1 = max login limit reached
  // 2 = password incorrect

  Box<String> userBox = Hive.box(userBoxName);
  String? wifiPassword = userBox.get('wifiPassword');

  if (wifiPassword == null) {
    return -1;
  }

  String req = (await http.post(Uri.parse(hostelWifiLoginURL), body: {
    'mode': '191',
    'username': userBox.get('username'),
    'password': wifiPassword,
    'producttype': '0',
  }))
      .body;

  if (req.contains('signed in as')) {
    return 0;
  } else if (req.contains('maximum login limit')) {
    return 1;
  } else {
    return 2;
  }
}

void logoutSophosClient() {
  Box<String> userBox = Hive.box(userBoxName);
  http.post(Uri.parse(hostelWifiLoginURL), body: {
    'mode': '193',
    'username': userBox.get('username'),
    'producttype': '0',
  });
}

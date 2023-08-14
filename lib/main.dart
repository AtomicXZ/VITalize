import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';
import 'package:vitalize/my_app.dart';
import 'package:vitalize/app/core/utils/http_override.dart';

void main() async {
  await Hive.initFlutter();
  registerAllAdapters();
  await openAllBoxes();
  // for sophos wifi client
  HttpOverrides.global = DevHttpOverrides();
  runApp(const MyApp());
}

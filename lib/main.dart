import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';
import 'package:vitalize/my_app.dart';

void main() async {
  await Hive.initFlutter();
  registerAllAdapters();
  await openAllBoxes();
  runApp(const MyApp());
}

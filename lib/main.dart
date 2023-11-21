import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/app/core/utils/hive_user_box_utils.dart';
import 'package:vitalize/my_app.dart';
import 'package:vitalize/app/core/utils/http_override.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await hiveStartUp;
  // for sophos wifi client
  HttpOverrides.global = DevHttpOverrides();
  AwesomeNotifications().initialize(
      'resource://drawable/res_icon',
      [
        NotificationChannel(
          channelGroupKey: 'class_reminder_group',
          channelKey: 'class_reminder',
          channelName: 'Class Reminder Notifications',
          channelDescription: 'Notification channel for class reminders',
          ledColor: Colors.white,
        )
      ],
      debug: true);
  runApp(const MyApp());
}

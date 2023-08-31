import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:vitalize/app/core/utils/time_utils.dart';
import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/models/periods.dart';
import 'package:vitalize/data/repositories/hive_timetable_repository.dart';

void sendNotification() async {
  if (!(await askNotificationPermission())) return;

  Map<dynamic, Periods> periods =
      await HiveTimetableRepository().getTimetableFromBox;

  Period period = periods.values.elementAt(0).periods[0];
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 50505,
      channelKey: 'class_reminder',
      title: 'Your class starts at ${period.startTime}',
      body: 'You have ${period.name} in ${period.location}.',
      wakeUpScreen: true,
      category: NotificationCategory.Reminder,
    ),
  );
}

void scheduleClassNotifcations(int minutesBeforeClass) async {
  if (!(await askNotificationPermission())) return;
  if (minutesBeforeClass == 0) return cancelNotifications();

  Map<dynamic, Periods> periods =
      await HiveTimetableRepository().getTimetableFromBox;
  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();

  for (int i = 0; i < periods.length; i++) {
    for (int j = 0; j < periods.values.elementAt(i).periods.length; j++) {
      Period period = periods.values.elementAt(i).periods[j];
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: int.parse('$i$j'),
          channelKey: 'class_reminder',
          title: 'Your class starts at ${period.startTime}',
          body: 'You have ${period.name} in ${period.location}.',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
        ),
        schedule: NotificationCalendar(
          weekday: numberFromDay(periods.keys.elementAt(i)),
          hour: int.parse(period.startTime.split(':')[0]) - 1,
          minute: 60 - minutesBeforeClass,
          second: 0,
          timeZone: localTimeZone,
          repeats: true,
        ),
      );
    }
  }
}

Future<bool> askNotificationPermission() async {
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
    if (!isAllowed) {
      return await AwesomeNotifications()
          .requestPermissionToSendNotifications();
    }
  });
  return true;
}

void cancelNotifications() {
  AwesomeNotifications().cancelAllSchedules();
}

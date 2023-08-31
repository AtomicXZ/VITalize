import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:vitalize/app/core/utils/time_utils.dart';
import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/models/periods.dart';
import 'package:vitalize/data/repositories/hive_timetable_repository.dart';

final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

void scheduleClassNotifcations(int minutesBeforeClass) async {
  if (!(await askNotificationPermission())) return;
  cancelNotifications();
  Map<dynamic, Periods> periods =
      await HiveTimetableRepository().getTimetableFromBox;
  String localTimeZone =
      await awesomeNotifications.getLocalTimeZoneIdentifier();

  for (int i = 0; i < periods.length; i++) {
    for (int j = 0; j < periods.values.elementAt(i).periods.length; j++) {
      Period period = periods.values.elementAt(i).periods[j];
      await awesomeNotifications.createNotification(
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
  await awesomeNotifications.isNotificationAllowed().then((isAllowed) async {
    if (!isAllowed) {
      return await awesomeNotifications.requestPermissionToSendNotifications();
    }
  });
  return true;
}

void cancelNotifications() {
  awesomeNotifications.cancelAllSchedules();
}

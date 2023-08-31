import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vitalize/app/core/utils/hive_user_box_utils.dart';
import 'package:vitalize/app/core/utils/schedule_notifcations.dart';

class NotificationsCard extends StatefulWidget {
  const NotificationsCard({super.key});

  @override
  State<NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  late double _currentNotificationValue;

  @override
  void initState() {
    _currentNotificationValue = double.parse(getString(reminderTime) ?? '0');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(FluentIcons.mail_24_regular),
              title: Text('Schedule notifications for classes'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Time in minutes'),
                  Slider(
                    value: _currentNotificationValue,
                    max: 30,
                    divisions: 6,
                    label: _currentNotificationValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentNotificationValue = value;
                      });
                    },
                    onChangeEnd: (value) {
                      setKeyValue(reminderTime, value);
                      ScaffoldMessenger.of(context).clearSnackBars();
                      if (value == 0) {
                        cancelNotifications();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Class notifications are disabled.'),
                          ),
                        );
                      } else {
                        scheduleClassNotifcations(value.round());
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Class notifications set to show ${value.round()} minutes before class.'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

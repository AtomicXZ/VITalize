import 'package:intl/intl.dart';

String get todayAsWord {
  return dayAsWords(DateTime.now().weekday);
}

String dayAsWords(int day) {
  final dayNames = {
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
  };
  return dayNames[day] ?? 'Holiday';
}

String get getCurrentTime {
  final DateTime now = DateTime.now();
  return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
}

String get getTodaysDate {
  return DateFormat.yMd().format(DateTime.now());
}

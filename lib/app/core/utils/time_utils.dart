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

int numberFromDay(String day) {
  final dayNumbers = {
    'Monday': 1,
    'Tuesday': 2,
    'Wednesday': 3,
    'Thursday': 4,
    'Friday': 5,
    'Saturday': 6,
    'Sunday': 7,
  };
  return dayNumbers[day] ?? -1;
}

String get getCurrentTime {
  final DateTime now = DateTime.now();
  return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
}

String get getTodaysDate {
  return DateFormat.yMd().format(DateTime.now());
}

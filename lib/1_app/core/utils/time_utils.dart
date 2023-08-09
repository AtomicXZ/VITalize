String get todayAsWord {
  int day = DateTime.now().weekday;

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
  //return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

  // get 25 minutes from current time this allows us to keep the next period tab
  // open for 25 minutes after the period has started
  return '${now.hour.toString().padLeft(2, '0')}:25';
}

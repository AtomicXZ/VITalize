String get todayAsWord {
  int day = DateTime.now().weekday;

  switch (day) {
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    default:
      return 'Holiday';
  }
}

String getCurrentTime() {
  final DateTime now = DateTime.now();
  final String twoDigitHour = _twoDigits(now.hour);
  final String twoDigitMinute = _twoDigits(now.minute);
  return '$twoDigitHour:$twoDigitMinute';
}

String _twoDigits(int n) {
  if (n >= 10) {
    return '$n';
  }
  return '0$n';
}

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

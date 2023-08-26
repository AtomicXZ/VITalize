part of 'homepage_cubit.dart';

@immutable
abstract class HomePageState {
  final String header;
  const HomePageState({this.header = 'Today'});
}

class HomePageInitial extends HomePageState {}

class HomePagePeriods extends HomePageState {
  final List<Period> periods;

  const HomePagePeriods(this.periods, {super.header});
}

class HomePageNextDayPeriods extends HomePagePeriods {
  const HomePageNextDayPeriods(List<Period> periods, String header)
      : super(periods, header: header);
}

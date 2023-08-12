part of 'home_page_next_period_cubit.dart';

@immutable
abstract class HomePageNextPeriodState {}

class HomePageNextPeriodInitial extends HomePageNextPeriodState {}

class HomePageNextPeriod extends HomePageNextPeriodState {
  final Period period;

  HomePageNextPeriod(this.period);
}

class HomePageNoNextPeriod extends HomePageNextPeriodState {}

class HomePageNextPeriodHoliday extends HomePageNextPeriodState {}

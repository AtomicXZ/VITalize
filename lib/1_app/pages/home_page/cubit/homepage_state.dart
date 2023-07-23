part of 'homepage_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePagePeriods extends HomePageState {
  final List<Period> periods;

  HomePagePeriods(this.periods);
}

class HomePageHoliday extends HomePageState {}

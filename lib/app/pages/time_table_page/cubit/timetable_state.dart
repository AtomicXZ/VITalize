part of 'timetable_cubit.dart';

@immutable
abstract class TimetableState {}

class TimetableInitial extends TimetableState {}

class TimetableLoading extends TimetableState {}

class TimetablePeriods extends TimetableState {
  final List<Period> periods;

  TimetablePeriods(this.periods);
}

class TimetableHoliday extends TimetableState {}

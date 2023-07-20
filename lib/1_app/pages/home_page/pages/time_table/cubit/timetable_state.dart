part of 'timetable_cubit.dart';

@immutable
abstract class TimetableState {}

class TimetableInitial extends TimetableState {}

class TimetableLoading extends TimetableState {}

class TimetableLoaded extends TimetableState {
  final List<Period> periods;

  TimetableLoaded(this.periods);
}

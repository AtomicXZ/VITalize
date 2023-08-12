part of 'exam_schedule_cubit.dart';

@immutable
sealed class ExamScheduleState {}

final class ExamScheduleInitial extends ExamScheduleState {}

final class ExamScheduleNoData extends ExamScheduleState {}

final class ExamScheduleLoaded extends ExamScheduleState {
  final Map examSchedule;

  ExamScheduleLoaded(this.examSchedule);
}

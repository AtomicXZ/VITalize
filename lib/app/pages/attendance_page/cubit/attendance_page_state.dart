part of 'attendance_page_cubit.dart';

@immutable
abstract class AttendancePageState {}

class AttendancePageInitial extends AttendancePageState {}

class AttendancePageLoaded extends AttendancePageState {
  final Map<dynamic, Attendance> attendance;

  AttendancePageLoaded(this.attendance);
}

class AttendancePageNoAttendanceInThisSem extends AttendancePageState {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/data/models/attendance.dart';
import 'package:vitalize/data/models/response.dart';
import 'package:vitalize/data/repositories/hive_attendance_repository.dart';

part 'attendance_page_state.dart';

class AttendancePageCubit extends Cubit<AttendancePageState> {
  HiveAttendanceRepository repository = HiveAttendanceRepository();
  ResponseStatus status = ResponseStatus.fromBox;
  AttendancePageCubit() : super(AttendancePageInitial());

  void loadAttendance(Response<Map<dynamic, Attendance>> response) {
    Map<dynamic, Attendance> attendance = response.response;
    status = response.status;
    if (attendance.isNotEmpty) {
      emit(AttendancePageLoaded(attendance));
    } else {
      emit(AttendancePageNoAttendanceInThisSem());
    }
  }

  Future<void> loadAttendanceFromBox() async {
    loadAttendance(await repository.getAttendanceFromBox);
  }

  Future<void> loadAttendanceFromApi() async {
    loadAttendance(await repository.getAttendanceFromApiAndCache);
  }

  bool get responseStatus => Response.responseStatus(status);
}

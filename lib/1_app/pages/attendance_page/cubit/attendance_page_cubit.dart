import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/0_data/models/attendance.dart';
import 'package:vtop_app/0_data/repositories/hive_attendance_repository.dart';

part 'attendance_page_state.dart';

class AttendancePageCubit extends Cubit<AttendancePageState> {
  HiveAttendanceRepository repository = HiveAttendanceRepository();

  AttendancePageCubit() : super(AttendancePageInitial());

  void loadAttendance() async {
    Map<dynamic, Attendance> attendance =
        await repository.getAttendanceFromApiAndCache;
    if (attendance.isNotEmpty) {
      emit(AttendancePageLoaded(attendance));
    } else {
      emit(AttendancePageNoAttendanceInThisSem());
    }
  }
}

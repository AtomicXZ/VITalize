import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/0_data/models/period.dart';

import 'package:vtop_app/0_data/repositories/hive_timetable_repository.dart';
import 'package:vtop_app/1_app/core/utils/day.dart';

part 'timetable_state.dart';

class TimetableCubit extends Cubit<TimetableState> {
  HiveTimetableRepository repository = HiveTimetableRepository();

  TimetableCubit() : super(TimetableInitial());

  void todayTimeTable() async {
    emit(TimetableLoading());
    String day = todayAsWord;
    if (day != 'Holiday') {
      List<Period> periods =
          (await repository.getTimetableFromBox)[todayAsWord]!;
      emit(TimetablePeriods(periods));
    } else {
      emit(TimetableHoliday());
    }
  }

  void timetableByDay(String day) async {
    emit(TimetableLoading());
    List<Period> periods = (await repository.getTimetableFromBox)[day]!;
    emit(TimetablePeriods(periods));
  }
}

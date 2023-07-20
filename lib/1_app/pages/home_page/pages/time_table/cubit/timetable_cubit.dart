import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/0_data/models/period.dart';

part 'timetable_state.dart';

class TimetableCubit extends Cubit<TimetableState> {
  TimetableCubit() : super(TimetableInitial());

  void dayTimeTable(String day) async {
    emit(TimetableLoading());

    final Period period1 = Period(
        name: 'Maths',
        code: 'MAT1102',
        slot: 'SA1',
        location: 'AB-1 G02',
        startTime: '14:00',
        endTime: '14:50');
    final Period period2 = Period(
        name: 'Professional english for men',
        code: 'MAT1102',
        slot: 'B2',
        location: 'AB-5 G02',
        startTime: '17:00',
        endTime: '14:50');
    final Period period3 = Period(
        name: 'Lelllaefmoieaknfaef',
        code: 'MAT1102',
        slot: 'SA1',
        location: 'AB-1 G02',
        startTime: '14:00',
        endTime: '14:50');
    final Period period4 = Period(
        name: 'Hell to the bitches',
        code: 'MAT1102',
        slot: 'SA1',
        location: 'AB-1 G02',
        startTime: '14:00',
        endTime: '14:50');

    final Map<String, List<Period>> periods = {
      'Tuesday': [period1, period2, period3, period4],
      'Wednesday': [period4, period2, period3, period1],
      'Thursday': [period3, period2, period3, period2, period1, period1],
      'Friday': [period2, period2, period4, period1],
      'Saturday': [period2],
    };

    await Future.delayed(const Duration(seconds: 1));
    emit(TimetableLoaded(periods[day]!));
  }
}

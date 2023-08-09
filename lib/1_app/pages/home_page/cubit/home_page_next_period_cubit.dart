import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/0_data/models/period.dart';
import 'package:vtop_app/0_data/repositories/hive_timetable_repository.dart';
import 'package:vtop_app/1_app/core/utils/time_utils.dart';

part 'home_page_next_period_state.dart';

class HomePageNextPeriodCubit extends Cubit<HomePageNextPeriodState> {
  HiveTimetableRepository repository = HiveTimetableRepository();

  HomePageNextPeriodCubit() : super(HomePageNextPeriodInitial()) {
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(minutes: 5), (_) {
      getNextPeriod();
    });
  }

  void getNextPeriod() async {
    List<Period> periods = await repository.getTodaysPeriods();

    if (periods.isNotEmpty) {
      for (var period in periods) {
        if (period.endTime.compareTo(getCurrentTime) > 0) {
          emit(HomePageNextPeriod(period));
          return;
        }
      }
      emit(HomePageNoNextPeriod());
    } else {
      emit(HomePageNextPeriodHoliday());
    }
  }

  void emitLoadingState() => emit(HomePageNextPeriodInitial());
}

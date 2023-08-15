import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/repositories/hive_timetable_repository.dart';
import 'package:vitalize/app/core/utils/time_utils.dart';

part 'home_page_next_period_state.dart';

class HomePageNextPeriodCubit extends Cubit<HomePageNextPeriodState> {
  HiveTimetableRepository repository = HiveTimetableRepository();
  late Timer _timer;

  HomePageNextPeriodCubit() : super(HomePageNextPeriodInitial()) {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 5), (_) {
      getNextPeriod();
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

  void getNextPeriod() async {
    List<Period> periods = await repository.getTodaysPeriods();

    if (periods.isNotEmpty) {
      for (var period in periods) {
        if ('${period.startTime.substring(0, 2)}:20'.compareTo(getCurrentTime) >
            0) {
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

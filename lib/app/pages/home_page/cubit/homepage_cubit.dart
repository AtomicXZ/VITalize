import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/app/core/utils/time_utils.dart';
import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/repositories/hive_timetable_repository.dart';

part 'homepage_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HiveTimetableRepository repository = HiveTimetableRepository();

  HomePageCubit() : super(HomePageInitial());

  void todaysTimetable() async {
    List<Period> periods = await repository.getTodaysPeriods();
    if (periods.isNotEmpty &&
        periods.last.endTime.compareTo(getCurrentTime) > 0) {
      emit(HomePagePeriods(periods));
    } else {
      int nextDay = DateTime.now().weekday + 1;
      while (true) {
        List<Period> dayPeriods =
            await repository.getSpecificDayPeriods(nextDay);
        if (dayPeriods.isNotEmpty) {
          emit(HomePageNextDayPeriods(dayPeriods, dayAsWords(nextDay)));
          return;
        }
        nextDay = nextDay + 1 > 7 ? 1 : nextDay + 1;
      }
    }
  }

  void emitLoadingState() => emit(HomePageInitial());
}

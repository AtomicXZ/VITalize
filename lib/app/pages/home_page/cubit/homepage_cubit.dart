import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/data/models/period.dart';
import 'package:vitalize/data/repositories/hive_timetable_repository.dart';

part 'homepage_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HiveTimetableRepository repository = HiveTimetableRepository();

  HomePageCubit() : super(HomePageInitial());

  void todaysTimetable() async {
    List<Period> periods = await repository.getTodaysPeriods();
    if (periods.isNotEmpty) {
      emit(HomePagePeriods(periods));
    } else {
      emit(HomePageHoliday());
    }
  }

  void emitLoadingState() => emit(HomePageInitial());
}

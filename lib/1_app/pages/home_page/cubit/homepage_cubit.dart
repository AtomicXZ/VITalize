import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/0_data/repositories/hive_timetable_repository.dart';
import 'package:vtop_app/1_app/core/utils/day.dart';

import '../../../../0_data/models/period.dart';

part 'homepage_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HiveTimetableRepository repository = HiveTimetableRepository();

  HomePageCubit() : super(HomePageInitial());

  void todayTimetable() async {
    emit(HomePageLoading());
    String day = todayAsWord;
    if (day != 'Holiday') {
      List<Period> periods =
          (await repository.getTimetableFromBox)[todayAsWord]!;
      emit(HomePagePeriods(periods));
    } else {
      emit(HomePageHoliday());
    }
  }
}

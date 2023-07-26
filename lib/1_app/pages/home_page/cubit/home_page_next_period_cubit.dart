import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:vtop_app/0_data/models/period.dart';
import 'package:vtop_app/1_app/core/utils/time_utils.dart';
import 'package:vtop_app/1_app/pages/home_page/cubit/utils.dart';

part 'home_page_next_period_state.dart';

class HomePageNextPeriodCubit extends Cubit<HomePageNextPeriodState> {
  HomePageNextPeriodCubit() : super(HomePageNextPeriodInitial());

  void getNextPeriod() async {
    List<Period> periods = await getTodaysPeriods();

    if (periods.isNotEmpty) {
      for (var period in periods) {
        if (period.startTime.compareTo(getCurrentTime()) > 0) {
          emit(HomePageNextPeriod(period));
          return;
        }
      }
      emit(HomePageNoNextPeriod());
    } else {
      emit(HomePageNextPeriodHoliday());
    }
  }
}

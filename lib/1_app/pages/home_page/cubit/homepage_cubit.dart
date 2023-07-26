import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vtop_app/0_data/models/period.dart';
import 'package:vtop_app/1_app/pages/home_page/cubit/utils.dart';

part 'homepage_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  void todaysTimetable() async {
    emit(HomePageLoading());
    List<Period> periods = await getTodaysPeriods();
    if (periods.isNotEmpty) {
      emit(HomePagePeriods(periods));
    } else {
      emit(HomePageHoliday());
    }
  }
}

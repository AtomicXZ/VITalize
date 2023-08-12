import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vitalize/data/repositories/hive_grades_repository.dart';

part 'grades_page_state.dart';

class GradesPageCubit extends Cubit<GradesPageState> {
  HiveGradesRepository repository = HiveGradesRepository();

  GradesPageCubit() : super(GradesPageInitial());

  void getGrades() async {
    emit(GradesPageLoaded(await repository.getGradesFromBox));
  }
}

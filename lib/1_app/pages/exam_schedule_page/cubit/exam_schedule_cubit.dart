import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vtop_app/0_data/repositories/hive_exam_schedule_repository.dart';

part 'exam_schedule_state.dart';

class ExamScheduleCubit extends Cubit<ExamScheduleState> {
  HiveExamScheduleRepository repository = HiveExamScheduleRepository();

  ExamScheduleCubit() : super(ExamScheduleInitial());

  void getExamSchedule() async {
    emit(ExamScheduleLoaded(await repository.getExamScheduleFromBox));
  }
}

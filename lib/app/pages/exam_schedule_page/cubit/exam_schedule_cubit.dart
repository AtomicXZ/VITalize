import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vitalize/data/repositories/hive_exam_schedule_repository.dart';

part 'exam_schedule_state.dart';

class ExamScheduleCubit extends Cubit<ExamScheduleState> {
  HiveExamScheduleRepository repository = HiveExamScheduleRepository();

  ExamScheduleCubit() : super(ExamScheduleInitial());

  void getExamSchedule() async {
    final examSchedule = await repository.getExamScheduleFromBox;

    if (examSchedule.isEmpty) {
      emit(ExamScheduleNoData());
    } else {
      emit(ExamScheduleLoaded(examSchedule));
    }
  }
}

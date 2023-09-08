import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vitalize/data/repositories/hive_exam_schedule_repository.dart';

part 'exam_schedule_state.dart';

class ExamScheduleCubit extends Cubit<ExamScheduleState> {
  HiveExamScheduleRepository repository = HiveExamScheduleRepository();

  ExamScheduleCubit() : super(ExamScheduleInitial());

  void getExamSchedule(Future<Map<dynamic, dynamic>> examSchedData) async {
    Map<dynamic, dynamic> examSchedule = await examSchedData;
    if (examSchedule.isEmpty ||
        examSchedule.values.last.values.first['date'] == '-') {
      emit(ExamScheduleNoData());
    } else {
      emit(ExamScheduleLoaded(examSchedule));
    }
  }

  void getExamScheduleFromBox() async {
    getExamSchedule(repository.getExamScheduleFromBox);
  }

  void getExamScheduleFromApi() async {
    getExamSchedule(repository.getExamScheduleFromApiAndCache);
  }

  void emitExamScheduleNoData() {
    emit(ExamScheduleNoData());
  }
}

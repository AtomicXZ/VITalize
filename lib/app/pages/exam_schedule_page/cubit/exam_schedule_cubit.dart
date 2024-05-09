import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vitalize/data/models/response.dart';
import 'package:vitalize/data/repositories/hive_exam_schedule_repository.dart';

part 'exam_schedule_state.dart';

class ExamScheduleCubit extends Cubit<ExamScheduleState> {
  HiveExamScheduleRepository repository = HiveExamScheduleRepository();
  ResponseStatus status = ResponseStatus.fromBox;
  ExamScheduleCubit() : super(ExamScheduleInitial());

  void getExamSchedule(Response<Map<dynamic, dynamic>> response) {
    Map<dynamic, dynamic> examSchedule = response.response;
    status = response.status;
    if (examSchedule.isEmpty ||
        examSchedule.values.last.values.first['date'] == '-') {
      emit(ExamScheduleNoData());
    } else {
      examSchedule.forEach((key, value) =>
          (value as Map).removeWhere((key, value) => value['date'] == ('-')));
      emit(ExamScheduleLoaded(examSchedule));
    }
  }

  Future<void> getExamScheduleFromBox() async {
    getExamSchedule(await repository.getExamScheduleFromBox);
  }

  Future<void> getExamScheduleFromApi() async {
    getExamSchedule(await repository.getExamScheduleFromApiAndCache);
  }

  void emitExamScheduleNoData() {
    emit(ExamScheduleNoData());
  }

  bool get responseStatus => Response.responseStatus(status);
}

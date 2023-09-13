import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vitalize/data/models/response.dart';
import 'package:vitalize/data/repositories/hive_grades_repository.dart';

part 'grades_page_state.dart';

class GradesPageCubit extends Cubit<GradesPageState> {
  HiveGradesRepository repository = HiveGradesRepository();
  ResponseStatus status = ResponseStatus.fromBox;
  GradesPageCubit() : super(GradesPageInitial());

  void getGrades(Response response) {
    status = response.status;
    emit(GradesPageLoaded(response.response));
  }

  Future<void> getGradesFromBox() async {
    getGrades(await repository.getGradesFromBox);
  }

  Future<void> getGradesFromApi() async {
    getGrades(await repository.getGradesFromApiAndCache);
  }

  bool get responseStatus => Response.responseStatus(status);
}

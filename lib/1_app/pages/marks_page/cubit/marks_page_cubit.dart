import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/0_data/models/marks.dart';
import 'package:vtop_app/0_data/repositories/marks_repository.dart';

part 'marks_page_state.dart';

class MarksPageCubit extends Cubit<MarksPageState> {
  MarksRepository repository = MarksRepository();
  String semID = '';

  MarksPageCubit() : super(MarksPageInitial());

  void getMarks(String semID) async {
    this.semID = semID;
    emit(MarksPageLoading());
    var data = await repository.getMarksFromApi(semID);
    data.fold(
      (failure) => emit(MarksPageError()),
      (marks) => emit(MarksPageLoaded(marks)),
    );
  }

  void getMarksFromVar() async {
    getMarks(semID);
  }
}

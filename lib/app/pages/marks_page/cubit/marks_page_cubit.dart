import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/data/models/marks.dart';
import 'package:vitalize/data/repositories/marks_repository.dart';

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
      (marks) {
        if (marks.isEmpty) {
          emit(MarksPageNoData());
        } else {
          emit(MarksPageLoaded(marks));
        }
      },
    );
  }

  void getMarksFromVar() async {
    getMarks(semID);
  }
}

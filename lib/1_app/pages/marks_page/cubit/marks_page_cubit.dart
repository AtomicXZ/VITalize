import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vtop_app/0_data/models/marks.dart';
import 'package:vtop_app/0_data/repositories/marks_repository.dart';

part 'marks_page_state.dart';

class MarksPageCubit extends Cubit<MarksPageState> {
  MarksRepository repository = MarksRepository();
  MarksPageCubit() : super(MarksPageInitial());

  void getMarks(String semID) async {
    emit(MarksPageLoading());
    emit(MarksPageLoaded(await repository.getMarksFromApi(semID)));
  }
}

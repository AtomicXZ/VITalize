import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:vtop_app/0_data/repositories/hive_sem_ids_repository.dart';

part 'marks_page_state.dart';

class SemesterIDsMenuCubit extends Cubit<SemesterIDsMenuState> {
  HiveSemIDsRepository repository = HiveSemIDsRepository();
  SemesterIDsMenuCubit() : super(SemesterIDsMenuInitial());

  void getSemIDs() async {
    Map<dynamic, String> semIDs = await repository.getSemIDsFromBox;
    List<MapEntry<dynamic, String>> sortedList = semIDs.entries.toList();
    sortedList.sort((a, b) => b.key.toString().compareTo(a.key.toString()));
    emit(SemesterIDsMenuLoaded(Map.fromEntries(sortedList)));
  }
}

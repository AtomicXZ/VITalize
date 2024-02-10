import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/data/repositories/hive_all_repository.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';
part 'rebuild_boxes_state.dart';

class RebuildBoxesCubit extends Cubit<RebuildBoxesState> {
  RebuildBoxesCubit() : super(RebuildBoxesInitial());

  Future<void> rebuildBoxes() async {
    emit(RebuildBoxesLoading());
    await deleteAllBoxesExceptUser();
    await openAllBoxesExceptUser();
    await HiveAllRepository().getAllFromApiAndCache;
    emit(RebuildBoxesSuccess());
  }
}

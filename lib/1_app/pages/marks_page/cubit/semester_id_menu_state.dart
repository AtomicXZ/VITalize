part of 'semester_id_menu_cubit.dart';

@immutable
abstract class SemesterIDsMenuState {}

class SemesterIDsMenuInitial extends SemesterIDsMenuState {}

class SemesterIDsMenuLoaded extends SemesterIDsMenuState {
  final Map<dynamic, String> semIDs;
  SemesterIDsMenuLoaded(this.semIDs);
}

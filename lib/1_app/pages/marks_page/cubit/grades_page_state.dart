part of 'grades_page_cubit.dart';

@immutable
sealed class GradesPageState {}

final class GradesPageInitial extends GradesPageState {}

final class GradesPageLoaded extends GradesPageState {
  final Map grades;

  GradesPageLoaded(this.grades);
}

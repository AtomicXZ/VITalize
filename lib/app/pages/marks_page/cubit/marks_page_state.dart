part of 'marks_page_cubit.dart';

@immutable
abstract class MarksPageState {}

class MarksPageInitial extends MarksPageState {}

class MarksPageLoading extends MarksPageState {}

class MarksPageError extends MarksPageState {}

class MarksPageNoData extends MarksPageState {}

class MarksPageLoaded extends MarksPageState {
  final Map<dynamic, Marks> marks;

  MarksPageLoaded(this.marks);
}

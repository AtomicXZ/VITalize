part of 'rebuild_boxes_cubit.dart';

sealed class RebuildBoxesState {}

final class RebuildBoxesInitial extends RebuildBoxesState {}

final class RebuildBoxesLoading extends RebuildBoxesState {}

final class RebuildBoxesSuccess extends RebuildBoxesState {}

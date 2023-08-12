part of 'profile_page_cubit.dart';

@immutable
abstract class ProfilePageState {}

class ProfilePageInitial extends ProfilePageState {}

class ProfilePageLoaded extends ProfilePageState {
  final Map<dynamic, String> profile;

  ProfilePageLoaded(this.profile);
}

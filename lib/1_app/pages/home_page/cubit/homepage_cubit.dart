import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(HomepageInitial());
}

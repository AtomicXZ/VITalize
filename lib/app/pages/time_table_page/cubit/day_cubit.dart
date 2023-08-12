import 'package:flutter_bloc/flutter_bloc.dart';

class DayCubit extends Cubit<String> {
  DayCubit() : super('');

  void setDay(String day) => emit(day);
}

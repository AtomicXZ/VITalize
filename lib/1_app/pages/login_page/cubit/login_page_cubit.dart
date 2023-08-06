import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vtop_app/0_data/constants.dart';
import 'package:vtop_app/0_data/utils/hive_box_utils.dart';
import 'package:vtop_app/0_data/utils/verify_creds.dart';
import 'package:vtop_app/1_app/core/utils/cache_all_data.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageState.initial());

  void usernameChanged(String username) {
    emit(state.copyWith(username: username, status: LoginStatus.initial));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, status: LoginStatus.initial));
  }

  void verifyCredentials() async {
    emit(state.copyWith(status: LoginStatus.loading));
    if (!(await serverAvailable)) {
      emit(state.copyWith(status: LoginStatus.serverOffline));
    }

    bool credsAreValid = await isValid(state.username, state.password);
    if (credsAreValid) {
      await initializeApp();
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  void invalidCredentialsOKbuttonPressed() {
    emit(state.copyWith(status: LoginStatus.initial));
  }

  Future<void> initializeApp() async {
    Box<String> userBox = Hive.box(userBoxName);
    userBox.putAll({
      'username': state.username,
      'password': state.password,
      'isFirstLaunch': 'false',
    });
    await cacheAllData();
  }
}

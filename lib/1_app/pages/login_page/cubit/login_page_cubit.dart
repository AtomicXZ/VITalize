import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vtop_app/0_data/utils/verify_creds.dart';
import 'package:vtop_app/1_app/core/utils/cache_all_data.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageState.initial());

  void usernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void loginButtonPressed() {
    emit(state.copyWith(status: LoginStatus.loading));
    verifyCredentials();
  }

  void verifyCredentials() async {
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
    Box<String> userBox = Hive.box('userBox');
    userBox.putAll({
      'username': state.username,
      'password': state.password,
      'isFirstLaunch': 'false',
    });
    await cacheAllData();
  }
}

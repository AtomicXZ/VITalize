part of 'login_page_cubit.dart';

enum LoginStatus { initial, loading, success, failure, serverOffline }

class LoginPageState {
  final String username;
  final String password;
  final LoginStatus status;

  const LoginPageState({
    required this.username,
    required this.password,
    required this.status,
  });

  factory LoginPageState.initial() => const LoginPageState(
        username: '',
        password: '',
        status: LoginStatus.initial,
      );

  LoginPageState copyWith({
    String? username,
    String? password,
    LoginStatus? status,
  }) {
    return LoginPageState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}

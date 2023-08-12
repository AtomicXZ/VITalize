part of 'login_page_cubit.dart';

enum LoginStatus { initial, loading, success, failure, serverOffline }

class LoginPageState {
  final String username;
  final String password;
  final LoginStatus status;
  final String message;
  final String subtitle;

  const LoginPageState({
    required this.username,
    required this.password,
    required this.status,
    required this.message,
    required this.subtitle,
  });

  factory LoginPageState.initial() => const LoginPageState(
        username: '',
        password: '',
        message: '',
        subtitle: '',
        status: LoginStatus.initial,
      );

  LoginPageState copyWith({
    String? username,
    String? password,
    String? message,
    String? subtitle,
    LoginStatus? status,
  }) {
    return LoginPageState(
      username: username ?? this.username,
      password: password ?? this.password,
      message: message ?? this.message,
      subtitle: subtitle ?? this.subtitle,
      status: status ?? this.status,
    );
  }
}

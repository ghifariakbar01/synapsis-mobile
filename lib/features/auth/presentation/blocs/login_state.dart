part of 'login_bloc.dart';

abstract class LoginState {}

class InitialLogin extends LoginState {}

class LoadingLogin extends LoginState {}

class SuccessLogin extends LoginState {}

class SuccessLogout extends LoginState {}

class ErrorLogin extends LoginState {
  final String message;

  ErrorLogin(this.message);
}

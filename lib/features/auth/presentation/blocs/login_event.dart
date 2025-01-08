part of 'login_bloc.dart';

abstract class LoginEvent {}

class Login extends LoginEvent {
  final LoginTablet item;

  Login({required this.item});
}

class Logout extends LoginEvent {
  Logout();
}

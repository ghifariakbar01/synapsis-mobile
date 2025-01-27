part of 'init_bloc.dart';

abstract class InitState extends Equatable {
  const InitState();

  @override
  List<Object> get props => [];
}

class Initial extends InitState {}

class Auth extends InitState {}

class Unauth extends InitState {}

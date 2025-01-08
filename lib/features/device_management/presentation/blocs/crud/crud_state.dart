part of 'crud_bloc.dart';

abstract class CrudState {}

class Initial extends CrudState {}

class Loading extends CrudState {}

class SuccessRegister extends CrudState {}

class SuccessActivate extends CrudState {}

class Error extends CrudState {
  final String message;

  Error(this.message);
}

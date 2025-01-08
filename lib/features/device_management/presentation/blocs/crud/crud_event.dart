part of 'crud_bloc.dart';

abstract class CrudEvent {}

class RegisterEvent extends CrudEvent {
  final DeviceRegister register;

  RegisterEvent({required this.register});
}

class ActivateEvent extends CrudEvent {
  final String id;

  ActivateEvent({required this.id});
}

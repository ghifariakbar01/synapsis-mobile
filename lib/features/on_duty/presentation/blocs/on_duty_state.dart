part of 'on_duty_bloc.dart';

abstract class OnDutyState {}

class Initial extends OnDutyState {}

class Loading extends OnDutyState {}

class Success extends OnDutyState {}

class Full extends OnDutyState {
  final List<MessageDto> messages;

  Full(this.messages);
}

class Error extends OnDutyState {
  final String message;

  Error(this.message);
}

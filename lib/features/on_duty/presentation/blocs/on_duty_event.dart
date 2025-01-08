part of 'on_duty_bloc.dart';

abstract class OnDutyEvent {}

class Subscribe extends OnDutyEvent {
  Subscribe();
}

class Close extends OnDutyEvent {
  Close();
}

class Fetch extends OnDutyEvent {
  Fetch();
}

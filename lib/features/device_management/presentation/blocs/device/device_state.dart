part of 'device_bloc.dart';

abstract class DeviceState {}

class Initial extends DeviceState {}

class Loading extends DeviceState {}

class Loaded extends DeviceState {
  final Device device;

  Loaded(this.device);
}

class Error extends DeviceState {
  final String message;

  Error(this.message);
}

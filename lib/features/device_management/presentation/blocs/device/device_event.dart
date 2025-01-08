part of 'device_bloc.dart';

abstract class DeviceEvent {}

class FetchEvent extends DeviceEvent {
  final String id;

  FetchEvent({required this.id});
}

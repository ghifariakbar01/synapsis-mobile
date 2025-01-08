/*
   Discarded - Use postman instead
*/

part of 'unit_management_bloc.dart';

abstract class UnitManagementEvent {}

class ProcessEvent extends UnitManagementEvent {
  final CreateUnit item;

  ProcessEvent({required this.item});
}

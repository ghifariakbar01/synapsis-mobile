/*
   Discarded - Use postman instead
*/

part of 'unit_management_bloc.dart';

abstract class UnitManagementState {}

class Initial extends UnitManagementState {}

class Loading extends UnitManagementState {}

class Success extends UnitManagementState {}

class Error extends UnitManagementState {
  final String message;

  Error(this.message);
}

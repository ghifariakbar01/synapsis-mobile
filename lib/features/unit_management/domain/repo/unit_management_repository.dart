/*
   Discarded - Use postman instead
*/

import '../entities/create_unit.dart';

abstract class UnitManagementRepository {
  Future<bool> createUnit({required CreateUnit item});
  Future<bool> exportRoster();
}

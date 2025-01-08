/*
   Discarded - Use postman instead
*/

import '../../data/repo/unit_management_repository_impl.dart';
import '../entities/create_unit.dart';

class UnitManagementUsecase {
  final UnitManagementRepositoryImpl repository;

  UnitManagementUsecase(this.repository);

  Future<bool> createUnit({required CreateUnit item}) async {
    return repository.createUnit(item: item);
  }

  Future<bool> exportRoster() async {
    return repository.exportRoster();
  }
}

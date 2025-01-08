/*
   Discarded - Use postman instead
*/

import '../../domain/entities/create_unit.dart';
import '../../domain/repo/unit_management_repository.dart';
import '../datasources/unit_management_datasource.dart';

class UnitManagementRepositoryImpl implements UnitManagementRepository {
  final UnitManagementDatasource datasource;

  UnitManagementRepositoryImpl(this.datasource);

  @override
  Future<bool> createUnit({required CreateUnit item}) async {
    return datasource.createUnit(item: item);
  }

  @override
  Future<bool> exportRoster() async {
    return datasource.exportRoster();
  }
}

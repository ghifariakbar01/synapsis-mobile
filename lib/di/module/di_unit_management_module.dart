import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../features/unit_management/data/datasources/unit_management_datasource.dart';
import '../../features/unit_management/data/repo/unit_management_repository_impl.dart';
import '../../features/unit_management/domain/usecases/unit_management_usecase.dart';
import '../../features/unit_management/presentation/blocs/unit_management_bloc.dart';
import '../../features/unit_management/presentation/cubits/unit_management_cubit.dart';

@module
abstract class DiUnitManagementModule {
  @injectable
  UnitManagementDatasource unitManagementDataSource(Dio dio) {
    return UnitManagementDatasource(dio);
  }

  @injectable
  UnitManagementRepositoryImpl unitManagementRepository(
      UnitManagementDatasource dataSource) {
    return UnitManagementRepositoryImpl(dataSource);
  }

  @injectable
  UnitManagementUsecase unitManagementUseCase(
      UnitManagementRepositoryImpl repo) {
    return UnitManagementUsecase(repo);
  }

  @injectable
  UnitManagementBloc unitManagementBloc(UnitManagementUsecase crudUsecase) {
    return UnitManagementBloc(crudUsecase);
  }

  @injectable
  UnitManagementCubit unitManagementCubit() {
    return UnitManagementCubit();
  }
}

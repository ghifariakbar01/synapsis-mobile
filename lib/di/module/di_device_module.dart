import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../features/device_management/data/datasources/device_management_datasource.dart';
import '../../features/device_management/data/repo/device_management_repository_impl.dart';
import '../../features/device_management/domain/usecases/crud_usecase.dart';
import '../../features/device_management/domain/usecases/fetch_usecase.dart';
import '../../features/device_management/presentation/blocs/crud/crud_bloc.dart';
import '../../features/device_management/presentation/cubits/register_cubit.dart';

@module
abstract class DiDeviceModule {
  @injectable
  DeviceManagementDataSource deviceManagementDataSource(Dio dio) {
    return DeviceManagementDataSource(dio);
  }

  @injectable
  DeviceManagementRepositoryImpl deviceManagementRepository(
      DeviceManagementDataSource dataSource, FlutterSecureStorage storage) {
    return DeviceManagementRepositoryImpl(dataSource, storage);
  }

  @injectable
  CrudUsecase crudUseCase(DeviceManagementRepositoryImpl repo) {
    return CrudUsecase(repo);
  }

  @injectable
  FetchUsecase fetchUseCase(DeviceManagementRepositoryImpl repo) {
    return FetchUsecase(repo);
  }

  @injectable
  CrudBloc crudBloc(CrudUsecase crudUsecase) {
    return CrudBloc(crudUsecase);
  }

  @injectable
  RegisterCubit registerCubit() {
    return RegisterCubit();
  }
}

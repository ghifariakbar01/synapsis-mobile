// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_bloc_app_template/di/module/di_device_module.dart'
    as _i918;
import 'package:flutter_bloc_app_template/di/module/di_login_module.dart'
    as _i263;
import 'package:flutter_bloc_app_template/di/module/di_onduty_module.dart'
    as _i442;
import 'package:flutter_bloc_app_template/di/module/di_unit_management_module.dart'
    as _i361;
import 'package:flutter_bloc_app_template/features/auth/data/datasources/login_data_source.dart'
    as _i676;
import 'package:flutter_bloc_app_template/features/auth/data/repo/login_repository_impl.dart'
    as _i873;
import 'package:flutter_bloc_app_template/features/auth/domain/usecases/login_usecase.dart'
    as _i369;
import 'package:flutter_bloc_app_template/features/auth/presentation/blocs/login_bloc.dart'
    as _i348;
import 'package:flutter_bloc_app_template/features/auth/presentation/cubit/login_cubit.dart'
    as _i160;
import 'package:flutter_bloc_app_template/features/device_management/data/datasources/device_management_datasource.dart'
    as _i743;
import 'package:flutter_bloc_app_template/features/device_management/data/repo/device_management_repository_impl.dart'
    as _i692;
import 'package:flutter_bloc_app_template/features/device_management/domain/usecases/crud_usecase.dart'
    as _i557;
import 'package:flutter_bloc_app_template/features/device_management/domain/usecases/fetch_usecase.dart'
    as _i71;
import 'package:flutter_bloc_app_template/features/device_management/presentation/blocs/crud/crud_bloc.dart'
    as _i179;
import 'package:flutter_bloc_app_template/features/device_management/presentation/cubits/register_cubit.dart'
    as _i509;
import 'package:flutter_bloc_app_template/features/on_duty/data/datasources/on_duty_datasource.dart'
    as _i631;
import 'package:flutter_bloc_app_template/features/on_duty/presentation/blocs/on_duty_bloc.dart'
    as _i675;
import 'package:flutter_bloc_app_template/features/unit_management/data/datasources/unit_management_datasource.dart'
    as _i600;
import 'package:flutter_bloc_app_template/features/unit_management/data/repo/unit_management_repository_impl.dart'
    as _i738;
import 'package:flutter_bloc_app_template/features/unit_management/domain/usecases/unit_management_usecase.dart'
    as _i996;
import 'package:flutter_bloc_app_template/features/unit_management/presentation/blocs/unit_management_bloc.dart'
    as _i503;
import 'package:flutter_bloc_app_template/features/unit_management/presentation/cubits/unit_management_cubit.dart'
    as _i1051;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diUnitManagementModule = _$DiUnitManagementModule();
    final diLoginModule = _$DiLoginModule();
    final diDeviceModule = _$DiDeviceModule();
    final diOndutyModule = _$DiOndutyModule();
    gh.factory<_i1051.UnitManagementCubit>(
        () => diUnitManagementModule.unitManagementCubit());
    gh.factory<_i160.LoginCubit>(() => diLoginModule.loginCubit());
    gh.factory<_i509.RegisterCubit>(() => diDeviceModule.registerCubit());
    gh.factory<_i600.UnitManagementDatasource>(
        () => diUnitManagementModule.unitManagementDataSource(gh<_i361.Dio>()));
    gh.factory<_i676.LoginDataSource>(
        () => diLoginModule.loginDataSource(gh<_i361.Dio>()));
    gh.factory<_i743.DeviceManagementDataSource>(
        () => diDeviceModule.deviceManagementDataSource(gh<_i361.Dio>()));
    gh.factory<_i631.OnDutyDatasource>(
        () => diOndutyModule.deviceManagementDataSource(gh<_i361.Dio>()));
    gh.factory<_i738.UnitManagementRepositoryImpl>(() => diUnitManagementModule
        .unitManagementRepository(gh<_i600.UnitManagementDatasource>()));
    gh.factory<_i873.LoginRepositoryImpl>(() => diLoginModule.loginRepository(
          gh<_i676.LoginDataSource>(),
          gh<_i558.FlutterSecureStorage>(),
        ));
    gh.factory<_i692.DeviceManagementRepositoryImpl>(
        () => diDeviceModule.deviceManagementRepository(
              gh<_i743.DeviceManagementDataSource>(),
              gh<_i558.FlutterSecureStorage>(),
            ));
    gh.factory<_i675.OnDutyBloc>(
        () => diOndutyModule.onDutyBloc(gh<_i631.OnDutyDatasource>()));
    gh.factory<_i369.LoginUsecase>(
        () => diLoginModule.loginUseCase(gh<_i873.LoginRepositoryImpl>()));
    gh.factory<_i557.CrudUsecase>(() =>
        diDeviceModule.crudUseCase(gh<_i692.DeviceManagementRepositoryImpl>()));
    gh.factory<_i71.FetchUsecase>(() => diDeviceModule
        .fetchUseCase(gh<_i692.DeviceManagementRepositoryImpl>()));
    gh.factory<_i996.UnitManagementUsecase>(() => diUnitManagementModule
        .unitManagementUseCase(gh<_i738.UnitManagementRepositoryImpl>()));
    gh.factory<_i348.LoginBloc>(
        () => diLoginModule.loginBloc(gh<_i369.LoginUsecase>()));
    gh.factory<_i503.UnitManagementBloc>(() => diUnitManagementModule
        .unitManagementBloc(gh<_i996.UnitManagementUsecase>()));
    gh.factory<_i179.CrudBloc>(
        () => diDeviceModule.crudBloc(gh<_i557.CrudUsecase>()));
    return this;
  }
}

class _$DiUnitManagementModule extends _i361.DiUnitManagementModule {}

class _$DiLoginModule extends _i263.DiLoginModule {}

class _$DiDeviceModule extends _i918.DiDeviceModule {}

class _$DiOndutyModule extends _i442.DiOndutyModule {}

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/datasources/login_data_source.dart';
import '../../features/auth/data/repo/login_repository_impl.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/blocs/login_bloc.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';

@module
abstract class DiLoginModule {
  @injectable
  LoginDataSource loginDataSource(Dio dio) {
    return LoginDataSource(dio);
  }

  @injectable
  LoginRepositoryImpl loginRepository(
      LoginDataSource dataSource, FlutterSecureStorage secureStorage) {
    return LoginRepositoryImpl(dataSource, secureStorage);
  }

  @injectable
  LoginUsecase loginUseCase(LoginRepositoryImpl repo) {
    return LoginUsecase(repo);
  }

  @injectable
  LoginBloc loginBloc(LoginUsecase loginUsecase) {
    return LoginBloc(loginUsecase);
  }

  @injectable
  LoginCubit loginCubit() {
    return LoginCubit();
  }
}

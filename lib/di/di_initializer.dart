import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/urls.dart';
import 'di_container.dart';
import 'di_initializer.config.dart';

@injectableInit
Future<GetIt> initDI(GetIt getIt, String environment) async {
  registerDependencies();
  await diContainer.isReady<SharedPreferences>();

  diContainer.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: environment.url),
  )..interceptors.add(
      diContainer<Alice>().getDioInterceptor(),
    ));

  return getIt.init(environment: environment);
}

@module
void registerDependencies() {
  diContainer.registerLazySingletonAsync<SharedPreferences>(() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  });

  diContainer.registerSingleton<Alice>(Alice(showNotification: true));

  diContainer
      .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage(
    iOptions: IOSOptions(),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  ));
}

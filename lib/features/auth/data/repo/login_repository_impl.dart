import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/login_tablet.dart';
import '../../domain/repo/login_repository.dart';
import '../datasources/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;
  final FlutterSecureStorage secureStorage;

  LoginRepositoryImpl(this.dataSource, this.secureStorage);

  Future<bool> get isLoggedIn => secureStorage
      .read(key: 'login')
      .then((val) => val != null && val.isNotEmpty);

  @override
  Future<bool> loginTablet({required LoginTablet item}) async {
    await secureStorage.write(
      key: 'login',
      value: jsonEncode(item.toJson()),
    );

    return dataSource.loginTablet(item: item);
  }

  @override
  Future<bool> logout() async {
    await secureStorage.delete(
      key: 'login',
    );

    return Future.value(true);
  }
}

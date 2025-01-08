import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/entities/login_tablet.dart';

class LoginDataSource {
  final Dio dio;

  LoginDataSource(this.dio);

  Future<bool> loginTablet({
    required LoginTablet item,
  }) async {
    final response = await dio.post('/login-tablet-unit',
        data: jsonEncode(item.toJson()),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ));

    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }

    return response.statusCode == 200;
  }
}

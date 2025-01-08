import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/device.dart';
import '../dto/device_dto.dart';

class DeviceManagementDataSource {
  final Dio dio;

  DeviceManagementDataSource(this.dio);

  Future<bool> register({
    required String id,
    required String snHeadUnit,
  }) async {
    if (kDebugMode) {
      print('register');
      print('id: $id');
      print('snHeadUnit: $snHeadUnit');
      print('dio: ${dio.options.baseUrl}');
    }

    final _data = {
      "id": id,
      "head_unit_sn": snHeadUnit,
    };

    final response = await dio.post('/equipments/devices',
        data: jsonEncode(_data),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));

    if (response.statusCode != 201) {
      throw Exception(response.statusMessage);
    }

    return response.statusCode == 201;
  }

  Future<Device> deviceBy({required String id}) async {
    print('id: $id');
    final response = await dio.get('/equipments/devices/$id');

    final deviceDto = DeviceDto.fromJson(response as Map<String, dynamic>);

    final device = Device(
      deviceDto.id,
      deviceDto,
    );

    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }

    return device;
  }

  Future<bool> activate({required String id}) async {
    print('activate');
    print('id: $id');
    final json = {
      "nik": "12345", // don't change
      "password": "password" // don't change
    };

    final response1 = await dio.post(
      '/login',
      data: jsonEncode(json),
    );

    if (response1.statusCode != 200) {
      throw Exception(response1.statusMessage);
    }

    final response2 = await dio.post('/equipments/devices/$id/activation');

    if (response2.statusCode != 200) {
      throw Exception(response2.statusMessage);
    }

    return response2.statusCode == 200;
  }
}

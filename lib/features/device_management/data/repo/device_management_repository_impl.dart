import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/device.dart';
import '../../domain/repo/device_management_repository.dart';
import '../datasources/device_management_datasource.dart';

class DeviceManagementRepositoryImpl implements DeviceManagementRepository {
  final DeviceManagementDataSource dataSource;
  final FlutterSecureStorage storage;

  DeviceManagementRepositoryImpl(this.dataSource, this.storage);

  Future<bool> get hasStorage =>
      storage.read(key: 'device').then((value) => value != null);

  @override
  Future<bool> activate({required String id}) {
    return dataSource.activate(id: id);
  }

  @override
  Future<Device> deviceBy({required String id}) async {
    final resp = await dataSource.deviceBy(id: id);
    final json = resp.toJson();

    try {
      await storage.write(key: 'device', value: jsonEncode(json));
    } catch (err) {
      throw Exception('Gagal saat menyimpan');
    }

    return resp;
  }

  @override
  Future<Device?> fromStorage() async {
    try {
      final resp = await storage.read(key: 'device');
      if (resp == null) {
        return null;
      } else {
        final json = jsonDecode(resp);
        return Device.fromJson(json);
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<bool> register({required String id, required String snHeadUnit}) {
    return dataSource.register(id: id, snHeadUnit: snHeadUnit);
  }
}

/*
   Discarded - Use postman instead
*/

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/entities/create_unit.dart';

class UnitManagementDatasource {
  final Dio dio;

  UnitManagementDatasource(this.dio);

  Future<bool> createUnit({required CreateUnit item}) async {
    if (kDebugMode) {
      print('register');
      print('item: ${item.toString()}');
    }

    print('dio: ${dio.options.baseUrl}');
    final json = jsonEncode(item.toJson());
    print('json: $json');

    final response = await dio.post(
      '/equipments',
      data: json,
    );

    print('response: $response');

    if (response.statusCode != 201) {
      throw Exception(response.statusMessage);
    }

    return response.statusCode == 201;
  }

  Future<bool> exportRoster() async {
    // Request storage permission
    if (!await Permission.storage.request().isGranted) {
      return false;
    } else {
      // Get the device's external directory
      final directory = await getExternalStorageDirectory();
      final filePath = '${directory!.path}/downloaded_file.xlsx';

      print('filePath: $filePath');

      final response = await dio.download(
          '/projects/shifts/users/export?month_range=12-24&site_id=001D&is_template=false',
          filePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          // Update the download progress

          final downloadProgress = received / total;
          print('downloadProgress: $downloadProgress');
        }
      });

      print('complete');

      if (response.statusCode != 200) {
        throw Exception('Failed to export roster');
      }

      return response.statusCode == 200;
    }
  }
}

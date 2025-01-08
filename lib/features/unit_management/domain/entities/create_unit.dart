/*
   Discarded - Use postman instead
*/

import 'package:intl/intl.dart';

class CreateUnit {
  CreateUnit({
    required this.code,
    required this.deviceId,
    required this.serialNumber,
    required this.engineNo,
    required this.engineModel,
    required this.purchasedDate,
    required this.equipmentType,
    required this.manufacture,
    required this.modelId,
    required this.modificationId,
    required this.connexId,
    required this.hm,
    required this.km,
    required this.purchasedStatus,
    required this.conditionStatus,
    required this.siteId,
    required this.isActive,
  });

  factory CreateUnit.data({
    required String code,
    required String deviceId,
    required String serialNumber,
    required String engineNo,
    required String engineModel,
    required DateTime purchasedDate,
  }) =>
      CreateUnit.fromJson({
        "code": code, // change with random number, ex- TR-9991
        "device_id": deviceId,

        /// change with your device ID
        "serial_number": serialNumber, // change with random number, ex- TR-9991
        "engine_no": engineNo, // change with random number, ex- TR-9991
        "engine_model": engineModel, // change with random number, ex- TR-9991
        "purchased_date": DateFormat('yyyy-MM-dd HH:mm:ss')
            .format(purchasedDate)
            .replaceAll('.000', ''), // change with date created
        "equipment_type": "TR", // don't change
        "manufacture": "ea1070f3f7", // don't change
        "model_id": "a31dd00ce4", // don't change
        "modification_id": "45fa316025", // don't change
        "connex_id": "CNX23175", // don't change
        "hm": 4323, // don't change
        "km": 4123, // don't change
        "purchased_status": "New", // don't change
        "condition_status": "Running", // don't change
        "site_id": "001D", // don't change
        "is_active": true // don't change
      });

  final String? code;
  static const String codeKey = "code";

  final String? deviceId;
  static const String deviceIdKey = "device_id";

  final String? serialNumber;
  static const String serialNumberKey = "serial_number";

  final String? engineNo;
  static const String engineNoKey = "engine_no";

  final String? engineModel;
  static const String engineModelKey = "engine_model";

  final DateTime? purchasedDate;
  static const String purchasedDateKey = "purchased_date";

  final String? equipmentType;
  static const String equipmentTypeKey = "equipment_type";

  final String? manufacture;
  static const String manufactureKey = "manufacture";

  final String? modelId;
  static const String modelIdKey = "model_id";

  final String? modificationId;
  static const String modificationIdKey = "modification_id";

  final String? connexId;
  static const String connexIdKey = "connex_id";

  final int? hm;
  static const String hmKey = "hm";

  final int? km;
  static const String kmKey = "km";

  final String? purchasedStatus;
  static const String purchasedStatusKey = "purchased_status";

  final String? conditionStatus;
  static const String conditionStatusKey = "condition_status";

  final String? siteId;
  static const String siteIdKey = "site_id";

  final bool? isActive;
  static const String isActiveKey = "is_active";

  factory CreateUnit.fromJson(Map<String, dynamic> json) {
    return CreateUnit(
      code: json["code"],
      deviceId: json["device_id"],
      serialNumber: json["serial_number"],
      engineNo: json["engine_no"],
      engineModel: json["engine_model"],
      purchasedDate: DateTime.tryParse(json["purchased_date"] ?? ""),
      equipmentType: json["equipment_type"],
      manufacture: json["manufacture"],
      modelId: json["model_id"],
      modificationId: json["modification_id"],
      connexId: json["connex_id"],
      hm: json["hm"],
      km: json["km"],
      purchasedStatus: json["purchased_status"],
      conditionStatus: json["condition_status"],
      siteId: json["site_id"],
      isActive: json["is_active"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "device_id": deviceId,
        "serial_number": serialNumber,
        "engine_no": engineNo,
        "engine_model": engineModel,
        "purchased_date": DateFormat('yyyy-MM-dd HH:mm:ss')
            .format(purchasedDate!)
            .replaceAll('.000', ''),
        "equipment_type": equipmentType,
        "manufacture": manufacture,
        "model_id": modelId,
        "modification_id": modificationId,
        "connex_id": connexId,
        "hm": hm,
        "km": km,
        "purchased_status": purchasedStatus,
        "condition_status": conditionStatus,
        "site_id": siteId,
        "is_active": isActive,
      };

  @override
  String toString() {
    return 'CreateUnit(code: $code, deviceId: $deviceId, serialNumber: $serialNumber, engineNo: $engineNo, engineModel: $engineModel, purchasedDate: $purchasedDate, equipmentType: $equipmentType, manufacture: $manufacture, modelId: $modelId, modificationId: $modificationId, connexId: $connexId, hm: $hm, km: $km, purchasedStatus: $purchasedStatus, conditionStatus: $conditionStatus, siteId: $siteId, isActive: $isActive)';
  }
}

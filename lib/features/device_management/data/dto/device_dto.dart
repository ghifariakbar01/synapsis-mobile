class DeviceDto {
  DeviceDto({
    required this.id,
    required this.isActive,
    required this.activatedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.headUnitSn,
    required this.equipment,
  });

  final String id;
  static const String idKey = "id";

  final bool isActive;
  static const String isActiveKey = "is_active";

  final DateTime? activatedAt;
  static const String activatedAtKey = "activated_at";

  final DateTime? createdAt;
  static const String createdAtKey = "created_at";

  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  final String headUnitSn;
  static const String headUnitSnKey = "head_unit_sn";

  final dynamic equipment;
  static const String equipmentKey = "equipment";

  factory DeviceDto.fromJson(Map<String, dynamic> json) {
    return DeviceDto(
      id: json["id"] ?? "",
      isActive: json["is_active"] ?? false,
      activatedAt: DateTime.tryParse(json["activated_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      headUnitSn: json["head_unit_sn"] ?? "",
      equipment: json["equipment"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_active": isActive,
        "activated_at": activatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "head_unit_sn": headUnitSn,
        "equipment": equipment,
      };
}

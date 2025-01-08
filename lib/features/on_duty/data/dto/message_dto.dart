class MessageDto {
  MessageDto({
    required this.id,
    required this.name,
    required this.code,
    required this.categoryId,
    required this.sendingType,
    required this.defaultMessage,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
  });

  final String? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final int? code;
  static const String codeKey = "code";

  final String? categoryId;
  static const String categoryIdKey = "category_id";

  final List<String> sendingType;
  static const String sendingTypeKey = "sending_type";

  final String? defaultMessage;
  static const String defaultMessageKey = "default_message";

  final DateTime? createdAt;
  static const String createdAtKey = "created_at";

  final DateTime? updatedAt;
  static const String updatedAtKey = "updated_at";

  final String? categoryName;
  static const String categoryNameKey = "category_name";

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto(
      id: json["id"],
      name: json["name"],
      code: json["code"],
      categoryId: json["category_id"],
      sendingType: json["sending_type"] == null
          ? []
          : List<String>.from(json["sending_type"]!.map((x) => x)),
      defaultMessage: json["default_message"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      categoryName: json["category_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "category_id": categoryId,
        "sending_type": sendingType.map((x) => x).toList(),
        "default_message": defaultMessage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category_name": categoryName,
      };
}

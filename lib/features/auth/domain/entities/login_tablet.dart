class LoginTablet {
  LoginTablet({
    required this.unitId,
    required this.nik,
    required this.shiftId,
    required this.loginType,
  });

  final String? unitId;
  static const String unitIdKey = "unit_id";

  final String? nik;
  static const String nikKey = "nik";

  final String? shiftId;
  static const String shiftIdKey = "shift_id";

  final int? loginType;
  static const String loginTypeKey = "login_type";

  factory LoginTablet.data({
    required String nik,
  }) =>
      LoginTablet.fromJson({
        "nik": nik, // based on input from NIK field
        "unit_id":
            "82c728120c", // change with id from response when create unit
        "shift_id": DateTime.now().hour >= 5 && DateTime.now().hour < 17
            ? "048C-DS"
            : "048C-NS", // Use 048C-DS if you will do this challenge (run the app) on 05.00-17.00, and 048C-NS if you will do this challenge on 17.00-05.00
        "login_type": 1 // don't change
      });

  factory LoginTablet.fromJson(Map<String, dynamic> json) {
    return LoginTablet(
      unitId: json["unit_id"],
      nik: json["nik"],
      shiftId: json["shift_id"],
      loginType: json["login_type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "unit_id": unitId,
        "nik": nik,
        "shift_id": shiftId,
        "login_type": loginType,
      };
}

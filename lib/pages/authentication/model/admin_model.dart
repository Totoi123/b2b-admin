import 'dart:convert';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  AdminModel({
    this.token,
    this.adminData,
  });

  String token;
  AdminData adminData;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        token: json["token"],
        adminData: AdminData.fromJson(json["adminData"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "adminData": adminData.toJson(),
      };
}

class AdminData {
  AdminData({
    this.adminId,
    this.adminName,
    this.adminEmail,
    this.adminPassword,
  });

  String adminId;
  String adminName;
  String adminEmail;
  String adminPassword;

  factory AdminData.fromJson(Map<String, dynamic> json) => AdminData(
        adminId: json["admin_id"],
        adminName: json["admin_name"],
        adminEmail: json["admin_email"],
        adminPassword: json["admin_password"],
      );

  Map<String, dynamic> toJson() => {
        "admin_id": adminId,
        "admin_name": adminName,
        "admin_email": adminEmail,
        "admin_password": adminPassword,
      };
}

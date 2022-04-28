// To parse this JSON data, do
//
//     final clients = clientsFromJson(jsonString);

import 'dart:convert';

List<Clients> clientsFromJson(String str) =>
    List<Clients>.from(json.decode(str).map((x) => Clients.fromJson(x)));

String clientsToJson(List<Clients> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Clients {
  Clients({
    this.clientId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.companyName,
    this.password,
    this.createdBy,
    this.createdAt,
  });

  String clientId;
  String firstName;
  String lastName;
  String email;
  String phone;
  String companyName;
  String password;
  String createdBy;
  DateTime createdAt;

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        clientId: json["client_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        companyName: json["company_name"],
        password: json["password"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "company_name": companyName,
        "password": password,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
      };
}

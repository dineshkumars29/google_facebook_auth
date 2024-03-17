// To parse this JSON data, do
//
//     final customersListModel = customersListModelFromJson(jsonString);

import 'dart:convert';

CustomersListModel customersListModelFromJson(String str) =>
    CustomersListModel.fromJson(json.decode(str));

String customersListModelToJson(CustomersListModel data) =>
    json.encode(data.toJson());

class CustomersListModel {
  List<Customer>? customers;

  CustomersListModel({
    this.customers,
  });

  factory CustomersListModel.fromJson(Map<String, dynamic> json) =>
      CustomersListModel(
        customers: json["customers"] == null
            ? []
            : List<Customer>.from(
                json["customers"]!.map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customers": customers == null
            ? []
            : List<dynamic>.from(customers!.map((x) => x.toJson())),
      };
}

class Customer {
  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? phone;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  Customer({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        country: json["country"],
        phone: json["phone"],
        email: json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
        "country": country,
        "phone": phone,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// -----------------------------------------------------------------------------

CustomCustomersListModel customCustomersListModelFromJson(String str) =>
    CustomCustomersListModel.fromJson(json.decode(str));

String customCustomersListModelToJson(CustomCustomersListModel data) =>
    json.encode(data.toJson());

class CustomCustomersListModel {
  dynamic message;

  CustomCustomersListModel({
    this.message,
  });

  factory CustomCustomersListModel.fromJson(Map<String, dynamic> json) =>
      CustomCustomersListModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

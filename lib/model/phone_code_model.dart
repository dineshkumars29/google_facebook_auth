// To parse this JSON data, do
//
//     final phoneCodeModel = phoneCodeModelFromJson(jsonString);

import 'dart:convert';

PhoneCodeModel phoneCodeModelFromJson(String str) =>
    PhoneCodeModel.fromJson(json.decode(str));

String phoneCodeModelToJson(PhoneCodeModel data) => json.encode(data.toJson());

class PhoneCodeModel {
  List<PhoneCodeModelResult>? result;

  PhoneCodeModel({
    this.result,
  });

  factory PhoneCodeModel.fromJson(Map<String, dynamic> json) => PhoneCodeModel(
        result: json["result"] == null
            ? []
            : List<PhoneCodeModelResult>.from(
                json["result"]!.map((x) => PhoneCodeModelResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class PhoneCodeModelResult {
  String? code;
  String? label;
  String? phone;
  dynamic phoneLength;
  bool? suggested;
  int? min;
  int? max;

  PhoneCodeModelResult({
    this.code,
    this.label,
    this.phone,
    this.phoneLength,
    this.suggested,
    this.min,
    this.max,
  });

  factory PhoneCodeModelResult.fromJson(Map<String, dynamic> json) =>
      PhoneCodeModelResult(
        code: json["code"],
        label: json["label"],
        phone: json["phone"],
        phoneLength: json["phoneLength"],
        suggested: json["suggested"],
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "label": label,
        "phone": phone,
        "phoneLength": phoneLength,
        "suggested": suggested,
        "min": min,
        "max": max,
      };
}

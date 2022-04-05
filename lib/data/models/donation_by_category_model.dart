// To parse this JSON data, do
//
//     final donationsCategoryResponseModel = donationsCategoryResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DonationsCategoryResponseModel donationsCategoryResponseModelFromJson(String str) => DonationsCategoryResponseModel.fromJson(json.decode(str));

String donationsCategoryResponseModelToJson(DonationsCategoryResponseModel data) => json.encode(data.toJson());

class DonationsCategoryResponseModel {
    DonationsCategoryResponseModel({
        required this.success,
        required this.data,
        required this.messages,
    });

    bool success;
    List<Datum>? data;
    dynamic messages;

    factory DonationsCategoryResponseModel.fromJson(Map<String, dynamic> json) => DonationsCategoryResponseModel(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        messages: json["messages"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "messages": messages,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.categoryName,
        required this.dateModified,
        required this.dateCreated,
    });

    int id;
    String categoryName;
    DateTime? dateModified;
    DateTime? dateCreated;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        categoryName: json["categoryName"] == null ? null : json["categoryName"],
        dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
        dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "categoryName": categoryName == null ? null : categoryName,
        "dateModified": dateModified == null ? null : dateModified!.toIso8601String(),
        "dateCreated": dateCreated == null ? null : dateCreated!.toIso8601String(),
    };
}

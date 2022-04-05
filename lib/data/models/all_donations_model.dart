// To parse this JSON data, do
//
//     final allDonationsResponseModel = allDonationsResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllDonationsResponseModel allDonationsResponseModelFromJson(String str) => AllDonationsResponseModel.fromJson(json.decode(str));

String allDonationsResponseModelToJson(AllDonationsResponseModel data) => json.encode(data.toJson());

class AllDonationsResponseModel {
    AllDonationsResponseModel({
        required this.success,
        required this.data,
        required this.messages,
    });

    bool success;
    List<Datum>? data;
    dynamic messages;

    factory AllDonationsResponseModel.fromJson(Map<String, dynamic> json) => AllDonationsResponseModel(
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
        required this.userId,
        required this.categoryId,
        required this.title,
        required this.shortDescription,
        required this.description,
        required this.amountRaised,
        required this.amountGoal,
        required this.dateCreated,
        required this.endDate,
        required this.status,
        required this.imageUrl,
    });

    int id;
    int userId;
    int categoryId;
    String title;
    String shortDescription;
    String description;
    int amountRaised;
    int amountGoal;
    DateTime? dateCreated;
    DateTime? endDate;
    int status;
    String? imageUrl;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        title: json["title"] == null ? null : json["title"],
        shortDescription: json["shortDescription"] == null ? null : json["shortDescription"],
        description: json["description"] == null ? null : json["description"],
        amountRaised: json["amountRaised"] == null ? null : json["amountRaised"],
        amountGoal: json["amountGoal"] == null ? null : json["amountGoal"],
        dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        status: json["status"] == null ? null : json["status"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "categoryId": categoryId == null ? null : categoryId,
        "title": title == null ? null : title,
        "shortDescription": shortDescription == null ? null : shortDescription,
        "description": description == null ? null : description,
        "amountRaised": amountRaised == null ? null : amountRaised,
        "amountGoal": amountGoal == null ? null : amountGoal,
        "dateCreated": dateCreated == null ? null : dateCreated!.toIso8601String(),
        "endDate": endDate == null ? null : endDate!.toIso8601String(),
        "status": status == null ? null : status,
        "imageUrl": imageUrl == null ? null : imageUrl,
    };
}

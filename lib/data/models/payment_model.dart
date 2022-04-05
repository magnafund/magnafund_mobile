// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    PaymentModel({
        required this.name,
        required this.amount,
        required this.paymentMethod,
        required this.accountNumber,
        required this.donationId,
    });

    String name;
    int amount;
    int paymentMethod;
    String accountNumber;
    int donationId;

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        name: json["name"] == null ? null : json["name"],
        amount: json["amount"] == null ? null : json["amount"],
        paymentMethod: json["paymentMethod"] == null ? null : json["paymentMethod"],
        accountNumber: json["accountNumber"] == null ? null : json["accountNumber"],
        donationId: json["donationId"] == null ? null : json["donationId"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "amount": amount == null ? null : amount,
        "paymentMethod": paymentMethod == null ? null : paymentMethod,
        "accountNumber": accountNumber == null ? null : accountNumber,
        "donationId": donationId == null ? null : donationId,
    };
}

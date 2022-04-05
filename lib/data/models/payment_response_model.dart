// To parse this JSON data, do
//
//     final paymentResponseModel = paymentResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PaymentResponseModel paymentResponseModelFromJson(String str) => PaymentResponseModel.fromJson(json.decode(str));

String paymentResponseModelToJson(PaymentResponseModel data) => json.encode(data.toJson());

class PaymentResponseModel {
    PaymentResponseModel({
        required this.success,
        required this.data,
        required this.messages,
    });

    bool success;
    dynamic data;
    List<String>? messages;

    factory PaymentResponseModel.fromJson(Map<String, dynamic> json) => PaymentResponseModel(
        success: json["success"] == null ? null : json["success"],
        data: json["data"],
        messages: json["messages"] == null ? null : List<String>.from(json["messages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data,
        "messages": messages == null ? null : List<dynamic>.from(messages!.map((x) => x)),
    };
}

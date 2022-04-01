// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        required this.beneficiaryName,
        required this.email,
        required this.phoneNumber,
        required this.password,
    });

    String beneficiaryName;
    String email;
    String phoneNumber;
    String password;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        beneficiaryName: json["beneficiaryName"] == null ? null : json["beneficiaryName"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        password: json["password"] == null ? null : json["password"],
    );

    Map<String, dynamic> toJson() => {
        "beneficiaryName": beneficiaryName == null ? null : beneficiaryName,
        "email": email == null ? null : email,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "password": password == null ? null : password,
    };
}

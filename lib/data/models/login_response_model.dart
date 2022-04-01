// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        required this.success,
        required this.data,
        required this.messages,
    });

    bool success;
    Data? data;
    List<String>? messages;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        messages: json["messages"] == null ? null : List<String>.from(json["messages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toJson(),
        "messages": messages == null ? null : List<dynamic>.from(messages!.map((x) => x)),
    };
}

class Data {
    Data({
        required this.id,
        required this.beneficiaryName,
        required this.email,
        required this.phoneNumber,
        required this.password,
        required this.dateCreated,
        required this.status,
        required this.token,
    });

    int id;
    String beneficiaryName;
    String email;
    String phoneNumber;
    String password;
    DateTime? dateCreated;
    int status;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        beneficiaryName: json["beneficiaryName"] == null ? null : json["beneficiaryName"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        password: json["password"] == null ? null : json["password"],
        dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
        status: json["status"] == null ? null : json["status"],
        token: json["token"] == null ? null : json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "beneficiaryName": beneficiaryName == null ? null : beneficiaryName,
        "email": email == null ? null : email,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "password": password == null ? null : password,
        "dateCreated": dateCreated == null ? null : dateCreated!.toIso8601String(),
        "status": status == null ? null : status,
        "token": token == null ? null : token,
    };
}

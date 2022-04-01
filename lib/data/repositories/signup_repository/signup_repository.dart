import 'dart:convert';

import 'package:crowdfunding_mobile/data/models/signup_model.dart';
import 'package:crowdfunding_mobile/data/models/signup_response_model.dart';
import 'package:crowdfunding_mobile/data/repositories/signup_repository/signup_provider.dart';

class SignUpRepository{
  final SignUpprovider signUpprovider;

  SignUpRepository({required this.signUpprovider});

  Future<SignUpResponseModel> signUp(SignUpModel signUpModel) async {
    var data = await signUpprovider.signUp(signUpModel);
    return SignUpResponseModel.fromJson(jsonDecode(data));
  }
  
}
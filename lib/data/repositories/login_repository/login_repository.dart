import 'dart:convert';

import 'package:crowdfunding_mobile/data/models/login_model.dart';
import 'package:crowdfunding_mobile/data/models/login_response_model.dart';
import 'package:crowdfunding_mobile/data/repositories/login_repository/login_provider.dart';

class LoginRepository{
  final LoginProvider loginProvider;

  LoginRepository({required this.loginProvider});

  Future<LoginResponseModel> loginUser(
      {required LoginModel loginModel}) async {
    var data =
        await loginProvider.loginUser(loginModel);
    return LoginResponseModel.fromJson(jsonDecode(data));
  }

  Future persistToken(LoginResponseModel loginResponseModel) async {
     var data = await loginProvider.persistToken(loginResponseModel);
     return data;
  }

  Future<String ?> getTokenFromStorage() async{
    return await loginProvider.getTokenFromStorage();
  }
}
import 'package:crowdfunding_mobile/data/models/login_model.dart';
import 'package:crowdfunding_mobile/data/models/login_response_model.dart';
import 'package:crowdfunding_mobile/res/app_urls.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class LoginProvider{
   final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

      Future loginUser(LoginModel loginModel) async {

        var requestBody = {
          "email": loginModel.email,
          "password": loginModel.password
        };


        var headers = {
      'accept': 'text/plain',
      'Content-Type' : 'application/json'
      };

    // var response = await http.post(
    //     Uri.https(AppUrls.umUrl, '/Account/login'),
    //     body: requestBody,
    //     headers: headers
    //     );

      var response = await http.post(Uri.parse('https://cf-usermanagement-api.herokuapp.com/api/v1/Account/login'), body: jsonEncode(requestBody), headers: headers);
    print(response.statusCode);

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body)['message']);
    } else {
      print(response.body);
      return response.body;
    }
  }

  Future persistToken(LoginResponseModel loginResponseModel) async {
    await _flutterSecureStorage.write(
        key: 'access_token', value: loginResponseModel.data!.token);
    await _flutterSecureStorage.write(
        key: 'email', value: loginResponseModel.data!.email);
  }

  Future<String?> getTokenFromStorage() async {
    return _flutterSecureStorage.read(key: 'access_token');
  }




      
}
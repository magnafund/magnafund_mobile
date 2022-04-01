import 'dart:convert';

import 'package:crowdfunding_mobile/data/models/signup_model.dart';
import 'package:crowdfunding_mobile/res/app_urls.dart';
import 'package:http/http.dart' as http;

class SignUpprovider {
  Future signUp(SignUpModel signUpModel) async {
    var requestBody = jsonEncode({
      "beneficiaryName": signUpModel.beneficiaryName,
      "email": signUpModel.email,
      "password": signUpModel.password,
      "phoneNumber": signUpModel.phoneNumber,
    });

    var headers = {
      'accept': 'text/plain',
      'Content-Type' : 'application/json'
      };

    // var response = await http.post(
    //     Uri.http(AppUrls.umUrl, '/Account/sign-up'),
    //     body: requestBody,
    //     headers: headers
    //     );

        var response = await http.post(Uri.parse('https://cf-usermanagement-api.herokuapp.com/api/v1/Account/sign-up'), body: requestBody, headers: headers);
    print(response.statusCode);

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body)['message']);
    } else {
      print(response.body);
      return response.body;
    }
  }
}

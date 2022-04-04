import 'dart:convert';

import 'package:crowdfunding_mobile/data/models/payment_model.dart';
import 'package:http/http.dart' as http;

class PaymentProvider{

  Future makeDonation(PaymentModel paymentModel) async {

    var requestBody = {
      "name" : paymentModel.name,
      "amount": paymentModel.amount,
      "paymentMethod" : paymentModel.paymentMethod,
      "accountNumber" : paymentModel.accountNumber,
      "donationId" : paymentModel.donationId
    };

    var headers = {
      'accept': 'text/plain',
      'Content-Type' : 'application/json'
      };

      var response = await http.post(Uri.parse('https://cf-donations-api.herokuapp.com/api/Payment/process-payment'), headers: headers, body: requestBody);
      print(response.statusCode);

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body)['message']);
    } else {
      print(response.body);
      return response.body;
    }
  }
  
}
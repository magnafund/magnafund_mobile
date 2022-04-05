import 'dart:convert';

import 'package:crowdfunding_mobile/data/models/payment_model.dart';
import 'package:crowdfunding_mobile/data/models/payment_response_model.dart';
import 'package:crowdfunding_mobile/data/repositories/payment_repository/payment_provider.dart';

class PaymentRepository{
  final PaymentProvider paymentProvider;

  PaymentRepository({ required this.paymentProvider});

  Future<PaymentResponseModel> makeDonation(PaymentModel paymentModel) async {
    var data = await paymentProvider.makeDonation(paymentModel);
    return PaymentResponseModel.fromJson(jsonDecode(data));
  }
  
}
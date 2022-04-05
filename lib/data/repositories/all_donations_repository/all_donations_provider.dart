import 'package:crowdfunding_mobile/res/app_urls.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AllDonationProvider{
  Future getAllDonations() async {
    var response =
        await http.get(Uri.parse('https://cf-donations-api.herokuapp.com/api/v1/Donations/get-all-donations'));

    if (response.statusCode != 200) {
      throw Exception('Failed to get all packages ${response.statusCode}');
    }
    print(jsonDecode(response.body));

    return response.body;
  }
}
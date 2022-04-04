import 'dart:convert';

import 'package:crowdfunding_mobile/data/models/all_donations_model.dart';
import 'package:crowdfunding_mobile/data/models/donation_by_category_model.dart';
import 'package:crowdfunding_mobile/data/repositories/all_donations_repository/all_donations_provider.dart';
import 'package:crowdfunding_mobile/data/repositories/donation_categories_repository/donation_categories_provider.dart';

class AllDonationsRepository{
  
 
  final AllDonationProvider allDonationProvider;

  AllDonationsRepository({required this.allDonationProvider});

 

  

  Future<AllDonationsResponseModel> getAllDonations() async {
    var data = await allDonationProvider.getAllDonations();
    return AllDonationsResponseModel.fromJson(jsonDecode(data));
    // return data.map((e) => DonationsCategoryResponseModel.fromJson(e)).toList();
  }

}
import 'dart:convert';

import 'package:crowdfunding_mobile/data/models/donation_by_category_model.dart';
import 'package:crowdfunding_mobile/data/repositories/donation_categories_repository/donation_categories_provider.dart';

class DonationCategoriesRepository{
  
 
  final DonationCategoriesProvider donationCategoriesProvider;

  DonationCategoriesRepository({ required this.donationCategoriesProvider});

  

  Future<DonationsCategoryResponseModel> getDonationCategories() async {
    var data = await donationCategoriesProvider.getDonationCategories();
    return DonationsCategoryResponseModel.fromJson(jsonDecode(data));
    // return data.map((e) => DonationsCategoryResponseModel.fromJson(e)).toList();
  }

}
import 'package:crowdfunding_mobile/data/repositories/all_donations_repository/all_donations_provider.dart';
import 'package:crowdfunding_mobile/data/repositories/all_donations_repository/all_donations_repository.dart';
import 'package:crowdfunding_mobile/data/repositories/donation_categories_repository/donation_categories_provider.dart';
import 'package:crowdfunding_mobile/data/repositories/donation_categories_repository/donation_categories_repository.dart';
import 'package:crowdfunding_mobile/data/repositories/login_repository/login_provider.dart';
import 'package:crowdfunding_mobile/data/repositories/login_repository/login_repository.dart';
import 'package:crowdfunding_mobile/data/repositories/signup_repository/signup_provider.dart';
import 'package:crowdfunding_mobile/data/repositories/signup_repository/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRepositories extends StatelessWidget {
  final Widget appBlocs;
  const AppRepositories({Key? key, required this.appBlocs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                SignUpRepository(signUpprovider: SignUpprovider())),
        RepositoryProvider(
            create: (context) =>
                LoginRepository(loginProvider: LoginProvider())),
        RepositoryProvider(
            create: (context) => DonationCategoriesRepository(
                donationCategoriesProvider: DonationCategoriesProvider())),
        RepositoryProvider(
            create: (context) => AllDonationsRepository(
                allDonationProvider: AllDonationProvider())),
      ],
      child: appBlocs,
    );
  }
}

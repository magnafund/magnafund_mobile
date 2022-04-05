import 'package:crowdfunding_mobile/blocs/all_donations_bloc/all_donations_bloc.dart';
import 'package:crowdfunding_mobile/blocs/donations_categories_bloc/donations_categories_bloc.dart';
import 'package:crowdfunding_mobile/blocs/login_bloc/login_bloc.dart';
import 'package:crowdfunding_mobile/blocs/payment_bloc/payments_bloc.dart';
import 'package:crowdfunding_mobile/blocs/signup_bloc/signup_bloc.dart';
import 'package:crowdfunding_mobile/data/repositories/all_donations_repository/all_donations_repository.dart';
import 'package:crowdfunding_mobile/data/repositories/donation_categories_repository/donation_categories_repository.dart';
import 'package:crowdfunding_mobile/data/repositories/login_repository/login_repository.dart';
import 'package:crowdfunding_mobile/data/repositories/payment_repository/payment_repository.dart';
import 'package:crowdfunding_mobile/data/repositories/signup_repository/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  const AppBlocs({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SignupBloc(
                signUpRepository:
                    RepositoryProvider.of<SignUpRepository>(context))),
        BlocProvider(
            create: (context) => LoginBloc(
                loginRepository:
                    RepositoryProvider.of<LoginRepository>(context))),
        BlocProvider(
            create: (context) => DonationsCategoriesBloc(
                donationCategoriesRepository:
                    RepositoryProvider.of<DonationCategoriesRepository>(
                        context))),
        BlocProvider(
            create: (context) => AllDonationsBloc(
                allDonationsRepository:
                    RepositoryProvider.of<AllDonationsRepository>(context))),
        BlocProvider(
            create: (context) => PaymentsBloc(
                paymentRepository:
                    RepositoryProvider.of<PaymentRepository>(context)))
      ],
      child: app,
    );
  }
}

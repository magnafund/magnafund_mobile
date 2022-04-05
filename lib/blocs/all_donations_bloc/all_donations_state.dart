part of 'all_donations_bloc.dart';

@immutable
abstract class AllDonationsState {}

class AllDonationsInitial extends AllDonationsState {}

class AllDonationsLoadingState extends AllDonationsState {}

class AllDonationsLoadedState extends AllDonationsState {
  final AllDonationsResponseModel allDonationsResponseModel;

  AllDonationsLoadedState({required this.allDonationsResponseModel});

} 

class AllDonationsErrorState extends AllDonationsState {

  final String error;

  AllDonationsErrorState({required this.error});
}

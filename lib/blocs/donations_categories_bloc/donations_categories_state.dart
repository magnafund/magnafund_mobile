part of 'donations_categories_bloc.dart';

@immutable
abstract class DonationsCategoriesState {}

class DonationsCategoriesInitial extends DonationsCategoriesState {}

class DonationsCategoriesLoadingState extends DonationsCategoriesState {}

class DonationsCategoriesLoadedState extends DonationsCategoriesState {

  final DonationsCategoryResponseModel donationsCategoryResponseModel;

  DonationsCategoriesLoadedState({ required this.donationsCategoryResponseModel});

}

class DonationsCategoriesErrorState extends DonationsCategoriesState {

  final String error;

  DonationsCategoriesErrorState({ required this.error});
  
}

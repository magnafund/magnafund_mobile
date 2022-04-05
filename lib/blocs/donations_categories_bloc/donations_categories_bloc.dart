import 'package:bloc/bloc.dart';
import 'package:crowdfunding_mobile/data/models/donation_by_category_model.dart';
import 'package:crowdfunding_mobile/data/repositories/donation_categories_repository/donation_categories_repository.dart';
import 'package:meta/meta.dart';

part 'donations_categories_event.dart';
part 'donations_categories_state.dart';

class DonationsCategoriesBloc extends Bloc<DonationsCategoriesEvent, DonationsCategoriesState> {
 
 final DonationCategoriesRepository donationCategoriesRepository;
  DonationsCategoriesBloc({required this.donationCategoriesRepository}) : super(DonationsCategoriesInitial());

  @override
  Stream<DonationsCategoriesState> mapEventToState(DonationsCategoriesEvent event) async* {
    if (event is FetchDonationsCategoriesEvent) {
      try {
         print("***started");
        yield DonationsCategoriesLoadingState();
        print("***loading");
        var data = await donationCategoriesRepository.getDonationCategories();
        yield DonationsCategoriesLoadedState(donationsCategoryResponseModel: data);
         print("***loaded");
      } catch (e) {
        yield DonationsCategoriesErrorState(error: e.toString());
         print("***failed");
          print(e);
          print(e.toString());
      }
    }

    
  }
}

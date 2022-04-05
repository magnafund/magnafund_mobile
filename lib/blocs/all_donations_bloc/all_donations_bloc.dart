import 'package:bloc/bloc.dart';
import 'package:crowdfunding_mobile/data/models/all_donations_model.dart';
import 'package:crowdfunding_mobile/data/repositories/all_donations_repository/all_donations_repository.dart';
import 'package:meta/meta.dart';

part 'all_donations_event.dart';
part 'all_donations_state.dart';

class AllDonationsBloc extends Bloc<AllDonationsEvent, AllDonationsState> {
  final AllDonationsRepository allDonationsRepository;

  AllDonationsBloc({required this.allDonationsRepository})
      : super(AllDonationsInitial());

  @override
  Stream<AllDonationsState> mapEventToState(AllDonationsEvent event) async* {
    if (event is FetchAllDonationsEvent) {
      try {
        print("****started");
        yield AllDonationsLoadingState();
        print("***loading");
        var data = await allDonationsRepository.getAllDonations();
        yield AllDonationsLoadedState(allDonationsResponseModel: data);
        print("***loaded");
      } catch (e) {
        yield AllDonationsErrorState(error: e.toString());
        print("***failed");
        print(e);
        print(e.toString());
      }
    }
  }
}

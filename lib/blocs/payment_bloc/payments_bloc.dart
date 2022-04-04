import 'package:bloc/bloc.dart';
import 'package:crowdfunding_mobile/data/models/payment_model.dart';
import 'package:crowdfunding_mobile/data/models/payment_response_model.dart';
import 'package:crowdfunding_mobile/data/repositories/payment_repository/payment_repository.dart';
import 'package:meta/meta.dart';

part 'payments_event.dart';
part 'payments_state.dart';

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {

  final PaymentRepository paymentRepository;

  PaymentsBloc({ required this.paymentRepository}) : super(PaymentsInitial());

     @override
  Stream<PaymentsState> mapEventToState(
    PaymentsEvent event) async* {
      print("in bloc");
    
    if(event is MakePaymentEvent){
      try{
        print("***started loading");
        yield PaymentLoadingState();
        var data = await paymentRepository.makeDonation(event.paymentModel);
        print("***Loaded");
        print(data);
        yield PaymentLoadedState(paymentResponseModel: data);
      }catch(e){
        print("***Catch started");
        yield PaymentErrorState(error: e.toString());
        print("e");
      }
    }
    }

  
}

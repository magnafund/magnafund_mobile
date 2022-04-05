part of 'payments_bloc.dart';

@immutable
abstract class PaymentsEvent {}

class MakePaymentEvent extends PaymentsEvent {
    final PaymentModel paymentModel;

  MakePaymentEvent({ required this.paymentModel});


}

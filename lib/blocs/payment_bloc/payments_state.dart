part of 'payments_bloc.dart';

@immutable
abstract class PaymentsState {}

class PaymentsInitial extends PaymentsState {}

class PaymentLoadingState extends PaymentsState {}

class PaymentLoadedState extends PaymentsState {

  final PaymentResponseModel paymentResponseModel;

  PaymentLoadedState({ required this.paymentResponseModel});


}

class PaymentErrorState extends PaymentsState {

  final String error;

  PaymentErrorState({required this.error});


}

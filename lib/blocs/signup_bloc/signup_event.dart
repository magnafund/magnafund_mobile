part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class UserSignUpEvent extends SignupEvent {
  final SignUpModel signUpModel;

   UserSignUpEvent({required this.signUpModel});

  @override
  List<Object> get props => [signUpModel];
}
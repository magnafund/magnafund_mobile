part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpLoadingState extends SignupState {}

class SignUpLoadedState extends SignupState {



  final SignUpResponseModel signUpResponseModel;

  SignUpLoadedState({ required this.signUpResponseModel});

  
  @override
  List<Object> get props => [signUpResponseModel];

  
}

class SignUpErrorState extends SignupState {

    final String error;

   SignUpErrorState({required this.error});
  
  @override
  List<Object> get props => [error];
    
}
part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginLoadedState extends LoginState{

   final LoginResponseModel loginResponseModel;

  LoginLoadedState({ required this.loginResponseModel});

  

 @override
  List<Object> get props => [loginResponseModel];
}

class LoginErrorState extends LoginState{

  final String error;

  LoginErrorState({ required this.error});

  @override
  List<Object> get props => [];
}

import 'package:crowdfunding_mobile/blocs/signup_bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends StatelessWidget {

  final Widget app;
  const AppBlocs({ Key? key, required this.app }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => SignupBloc(
          
        ))
    ],
    child: app,
      
    );
  }
}
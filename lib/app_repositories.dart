import 'package:crowdfunding_mobile/data/repositories/signup_repository/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRepositories extends StatelessWidget {
  final Widget appBlocs;
  const AppRepositories({Key? key, required this.appBlocs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => 
        SignUpRepository()
        )

    ],
    child: appBlocs,
    );
  }
}
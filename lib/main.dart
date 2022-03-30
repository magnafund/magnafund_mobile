import 'package:crowdfunding_mobile/app_blocs.dart';
import 'package:crowdfunding_mobile/app_repositories.dart';
import 'package:crowdfunding_mobile/ui/splash_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  var config = const AppRepositories(
    appBlocs: AppBlocs(
      app: MyApp(),
    ),
  );

  runApp(config);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Telone Insurance',
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

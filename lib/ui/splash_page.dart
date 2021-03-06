import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/ui/donation_categories_page.dart';
import 'package:crowdfunding_mobile/ui/landing_page.dart';
import 'package:crowdfunding_mobile/ui/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LandingPage(
                  key: widget.key,
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: thirdColor,
        body: Center(
          child: Image.asset('assets/logo.png'),
        ));
  }
}

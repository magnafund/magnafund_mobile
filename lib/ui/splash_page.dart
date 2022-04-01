import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/ui/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
   @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  key: widget.key,
                )),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: yellow,
      
    );
  }
}
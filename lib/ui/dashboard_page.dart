import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavBarFb5(),
      
    );
  }
}
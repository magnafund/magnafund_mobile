import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/ui/donation_categories_page.dart';
import 'package:crowdfunding_mobile/ui/donations_menu_page.dart';
import 'package:crowdfunding_mobile/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: ListView(
        children: [
           SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/logo.png',
                  alignment: Alignment.topCenter,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              'WELCOME!',
              style: TextStyle(
                  color: black, fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              'Please Select an option to proceed',
              style: TextStyle(
                  color: black, fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
           SizedBox(
            height: 70,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
              child: ElevatedButton(
                child: const Text('Donate',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: DonationsMenu(
                            key: widget.key,
                          ),
                          type: PageTransitionType.leftToRight));
                },
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      // side: const BorderSide(color: mainColor, width: 4),
                    ))),
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
              child: ElevatedButton(
                child: const Text('Recieve Funds',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: _launchURL
                
                // () {

                  
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         child: LoginPage(
                  //           key: widget.key,
                  //         ),
                  //         type: PageTransitionType.leftToRight));
                // }
                ,
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      // side: const BorderSide(color: mainColor, width: 4),
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
  const url = 'https://crowdfundingzim-backend.web.app/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  
}}

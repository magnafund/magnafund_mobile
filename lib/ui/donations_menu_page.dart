import 'package:crowdfunding_mobile/ui/all_donations_page.dart';
import 'package:crowdfunding_mobile/ui/donation_categories_page.dart';
import 'package:crowdfunding_mobile/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crowdfunding_mobile/data/app_colors.dart';

class DonationsMenu extends StatefulWidget {
  const DonationsMenu({Key? key}) : super(key: key);

  @override
  _DonationsMenuState createState() => _DonationsMenuState();
}

class _DonationsMenuState extends State<DonationsMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        title: const Text("Donations"),
        backgroundColor: mainColor,
       
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                  child: Container(
                    width: 170,
                    child: CardFb1(
                      text: " All Donations",
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: AllDonationsPage(
                                  key: widget.key,
                                ),
                                type: PageTransitionType.leftToRight));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                  child: Container(
                    width: 170,
                    child: CardFb1(
                      text: "Donation Categories",
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DonationCategoriesPage(
                                  key: widget.key,
                                ),
                                type: PageTransitionType.leftToRight));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

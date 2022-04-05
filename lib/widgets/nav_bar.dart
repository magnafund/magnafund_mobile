import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/ui/dashboard_page.dart';
import 'package:crowdfunding_mobile/ui/donation_categories_page.dart';
import 'package:crowdfunding_mobile/ui/profile_page.dart';
import 'package:flutter/material.dart';


class BottomNavBarFb5 extends StatelessWidget {
  const BottomNavBarFb5({Key? key}) : super(key: key);

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: mainColor),
      child: BottomAppBar(
        
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBottomBar(
                    text: "Dashboard",
                    icon: Icons.speed,
                    selected: true,
                    onPressed: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashboardPage()),
                         );
                    }),
                IconBottomBar(
                    text: "Categories",
                    icon: Icons.history,
                    selected: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DonationCategoriesPage()),
                      );
                    }),
                IconBottomBar(
                    text: "Diary",
                    icon: Icons.dashboard,
                    selected: true,
                    onPressed: () {
                       // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ProfilePage()),
                      // );
                    }),
                IconBottomBar(
                    text: "Profile",
                    icon: Icons.account_circle,
                    selected: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                        
                      );
                    }),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
              Icon(icon, size: 25, color: selected ? white : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? white: Colors.grey),
        )
      ],
    );
  }
}

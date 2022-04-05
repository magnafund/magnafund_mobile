import 'package:crowdfunding_mobile/blocs/login_bloc/login_bloc.dart';
import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/ui/landing_page.dart';
import 'package:crowdfunding_mobile/ui/login_page.dart';
import 'package:crowdfunding_mobile/widgets/list.dart';
import 'package:crowdfunding_mobile/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late LoginLoadedState loadedState;

  @override
  void initState() {
    super.initState();
    loadedState = BlocProvider.of<LoginBloc>(context).state as LoginLoadedState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("My Profile"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.account_circle,
                color: mainColor,
                size: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      loadedState.loginResponseModel.data!.beneficiaryName,
                      style: const TextStyle(
                          color: mainColor, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    loadedState.loginResponseModel.data!.email,
                    style: const TextStyle(
                        color: mainColor, fontWeight: FontWeight.bold),
                  )),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    loadedState.loginResponseModel.data!.phoneNumber,
                    style: const TextStyle(
                        color: mainColor, fontWeight: FontWeight.bold),
                  )),
                ),
              FinanceListTile(
                text: "Change Password",
                leadingIcon: const Icon(
                  Icons.lock,
                  color: white,
                  size: 20.0,
                ),
                trailingIcon: const Icon(
                  Icons.chevron_right,
                  color: white,
                  size: 20.0,
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ChangePasswordPage()),
                  // );
                }),
            FinanceListTile(
                text: "Logout",
                leadingIcon: const Icon(
                  Icons.logout,
                  color: white,
                  size: 20.0,
                ),
                trailingIcon: const Icon(
                  Icons.chevron_right,
                  color: white,
                  size: 20.0,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('You have successfully logged out'),
                    backgroundColor: mainColor,
                  ));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LandingPage()),
                  );
                }),
                ],
              ),
            ),
          
           
            
            
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb5(),
    );
  }
}

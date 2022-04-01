import 'package:crowdfunding_mobile/blocs/login_bloc/login_bloc.dart';
import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/data/models/login_model.dart';
import 'package:crowdfunding_mobile/ui/dashboard_page.dart';
import 'package:crowdfunding_mobile/ui/donation_categories_page.dart';
import 'package:crowdfunding_mobile/ui/home_page.dart';
import 'package:crowdfunding_mobile/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: white,
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              'Magnafund',
              style: TextStyle(
                  color: mainColor, fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: SizedBox(
              // height: 55,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: mainColor, width: 15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: mainColor, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: mainColor, width: 2)),
                  filled: true,
                  hintStyle: const TextStyle(color: mainColor, fontSize: 13),
                  hintText: "Enter Username",
                  fillColor: white,
                ),
                style: const TextStyle(color: mainColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SizedBox(
              // height: 55,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: mainColor, width: 4)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: mainColor, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: mainColor, width: 2)),
                  filled: true,
                  hintStyle: const TextStyle(color: mainColor, fontSize: 13),
                  hintText: "Password",
                  fillColor: white,
                ),
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: mainColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 200),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     PageTransition(
                //         child: ForgotPasswordPage(
                //           key: widget.key,
                //         ),
                //         type: PageTransitionType.leftToRight));
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 2.85,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login Failed ${state.error}')));
              }

              if (state is LoginLoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Login Successful'),
                  backgroundColor: mainColor,
                ));
                Navigator.push(
                    context,
                    PageTransition(
                        child: DashboardPage(
                          key: widget.key,
                        ),
                        type: PageTransitionType.leftToRight));
              }
            },
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return Column(
                  children: [
                    CircularProgressIndicator(
                      key: widget.key,
                    ),
                    const Text(
                      'Login, Please wait...',
                      style: TextStyle(color: mainColor),
                    )
                  ],
                );
              }
              return SizedBox(
                height: 70,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: ElevatedButton(
                    child: const Text('Login',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(LoginUserEvent(
                          loginModel: LoginModel(
                              email: emailController.text,
                              password: passwordController.text)));
                    },
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: const BorderSide(color: black,width: 2),
                        ))),
                  ),
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35, bottom: 25),
            child: SizedBox(
              height: 20,
              child: Text(
                'Dont have an account?',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
              child: ElevatedButton(
                child: const Text('SIGN UP',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: SignUpPage(
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
        ],
      ),
    ));
  }
}

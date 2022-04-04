import 'package:crowdfunding_mobile/blocs/login_bloc/login_bloc.dart';
import 'package:crowdfunding_mobile/blocs/signup_bloc/signup_bloc.dart';
import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/data/models/signup_model.dart';
import 'package:crowdfunding_mobile/ui/home_page.dart';
import 'package:crowdfunding_mobile/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController beneficiaryNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool _validate = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool _validate4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("Sign Up"),
        ),
        body: Container(
      color: white,
      child: ListView(
        children: [
        
          // const Padding(
          //   padding: EdgeInsets.only(top: 70),
          //   child: Text(
          //     'Magnafund',
          //     style: TextStyle(
          //         color: mainColor, fontSize: 25, fontWeight: FontWeight.bold),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: SizedBox(
              // height: 55,
              child: TextFormField(
                controller: beneficiaryNameController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    filled: true,
                    hintStyle: const TextStyle(color: mainColor, fontSize: 13),
                    hintText: "Enter Beneficiary Name",
                    fillColor: white,
                    errorText:
                        _validate ? 'Beneficiary name Can\'t Be Empty' : null),
                style: const TextStyle(color: mainColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    filled: true,
                    hintStyle: const TextStyle(color: mainColor, fontSize: 13),
                    hintText: "Enter Email",
                    fillColor: white,
                    errorText: _validate2 ? 'Email Can\'t Be Empty' : null),
                style: const TextStyle(color: mainColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SizedBox(
              // height: 55,
              child: TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    filled: true,
                    hintStyle: const TextStyle(color: mainColor, fontSize: 13),
                    hintText: "Enter Phone Number",
                    fillColor: white,
                    errorText:
                        _validate3 ? 'Phone number Can\'t Be Empty' : null),
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
                        borderSide:
                            const BorderSide(color: mainColor, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: mainColor, width: 2)),
                    filled: true,
                    hintStyle: const TextStyle(color: mainColor, fontSize: 13),
                    hintText: "Enter Password",
                    fillColor: white,
                    errorText: _validate4 ? 'Password Can\'t Be Empty' : null),
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: mainColor),
              ),
            ),
          ),

          SizedBox(
       height: MediaQuery.of(context).size.height * 0.05,
          ),

          BlocConsumer<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is SignUpErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login Failed ${state.error}')));
              }

              if (state is SignUpLoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Signup Successful'),
                  backgroundColor: mainColor,
                ));
                Navigator.push(
                    context,
                    PageTransition(
                        child: LoginPage(
                          key: widget.key,
                        ),
                        type: PageTransitionType.leftToRight));
              }
            },
            builder: (context, state) {
              if (state is SignUpLoadingState) {
                return Column(
                  children: [
                    CircularProgressIndicator(
                      key: widget.key,
                    ),
                    const Text(
                      'Signing up, Please wait...',
                      style: TextStyle(color: mainColor),
                    )
                  ],
                );
              } else {
                return SizedBox(
                  height: 70,
                  width: 150,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 10, right: 30),
                    child: ElevatedButton(
                      child: const Text('SIGN UP',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        if (beneficiaryNameController.text.isEmpty &&
                            emailController.text.isEmpty &&
                            phoneNumberController.text.isEmpty &&
                            passwordController.text.isEmpty) {
                          setState(() {
                            _validate = true;
                            _validate2 = true;
                            _validate3 = true;
                             _validate4 = true;
                            return;
                          });
                        }
                         else if (beneficiaryNameController.text.isEmpty) {
                          setState(() {
                            _validate = true;
                            return;
                          });
                        } else if (emailController.text.isEmpty) {
                           setState(() {
                            _validate2 = true;
                            return;
                          });
                        } else if (phoneNumberController.text.isEmpty) {
                          setState(() {
                            _validate3 = true;
                            return;
                          });
                        } else if (passwordController.text.isEmpty) {
                          setState(() {
                            _validate4 = true;
                            return;
                          });
                        }
                         else {
                          BlocProvider.of<SignupBloc>(context).add(
                              UserSignUpEvent(
                                  signUpModel: SignUpModel(
                                      beneficiaryName:
                                          beneficiaryNameController.text,
                                      email: emailController.text,
                                      phoneNumber: phoneNumberController.text,
                                      password: passwordController.text)));
                        }
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
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35, bottom: 25),
            child: SizedBox(
              height: 20,
              child: Text(
                'Already have an account?',
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
                child: const Text('Login',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: LoginPage(
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

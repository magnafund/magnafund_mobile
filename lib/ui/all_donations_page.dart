import 'package:crowdfunding_mobile/blocs/all_donations_bloc/all_donations_bloc.dart';
import 'package:crowdfunding_mobile/blocs/payment_bloc/payments_bloc.dart';
import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/data/models/all_donations_model.dart';
import 'package:crowdfunding_mobile/data/models/payment_model.dart';
import 'package:crowdfunding_mobile/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDonationsPage extends StatefulWidget {
  const AllDonationsPage({Key? key}) : super(key: key);

  @override
  _AllDonationsPageState createState() => _AllDonationsPageState();
}

class _AllDonationsPageState extends State<AllDonationsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<AllDonationsBloc>(context).add(FetchAllDonationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        title: const Text('All Donations'),
        backgroundColor: mainColor,
      ),
      body: Container(
        color: thirdColor,
        child: BlocConsumer<AllDonationsBloc, AllDonationsState>(
          listener: (context, state) {
            if (state is AllDonationsErrorState) {
              Center(child: Text(state.error));
            }
          },
          builder: (context, state) {
            if (state is AllDonationsLoadingState) {
              return Loader(
                key: widget.key,
              );
            }
            if (state is AllDonationsLoadedState) {
              double height = MediaQuery.of(context).size.height;
              return Container(
                child: _buildAllDonationsList(state.allDonationsResponseModel),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  _buildAllDonationsList(AllDonationsResponseModel allDonationsResponseModel) {
    return ListView.builder(
        itemCount: allDonationsResponseModel.data!.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 5, left: 7, right: 7),
            child: InkWell(
                onTap: () {
                  showPaymentDialog(allDonationsResponseModel.data![index].id);
                },
                child: Card(
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      // side: const BorderSide(
                      //   // color: Colors.black,
                      //   width: 2.0,
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                        leading:
                            allDonationsResponseModel.data![index].categoryId ==
                                    1
                                ? const Icon(
                                    Icons.business,
                                    color: white,
                                    size: 20.0,
                                  )
                                : allDonationsResponseModel
                                            .data![index].categoryId ==
                                        2
                                    ? const Icon(
                                        Icons.medical_services,
                                        color: white,
                                        size: 20.0,
                                      )
                                    : allDonationsResponseModel
                                                .data![index].categoryId ==
                                            3
                                        ? const Icon(
                                            Icons.cake,
                                            color: white,
                                            size: 20.0,
                                          )
                                        : allDonationsResponseModel
                                                    .data![index].categoryId ==
                                                4
                                            ? const Icon(
                                                Icons.school,
                                                color: white,
                                                size: 20.0,
                                              )
                                            : allDonationsResponseModel
                                                        .data![index]
                                                        .categoryId ==
                                                    5
                                                ? const Icon(
                                                    Icons.people,
                                                    color: white,
                                                    size: 20.0,
                                                  )
                                                : allDonationsResponseModel
                                                            .data![index]
                                                            .categoryId ==
                                                        6
                                                    ? const Icon(
                                                        Icons.flag,
                                                        color: white,
                                                        size: 20.0,
                                                      )
                                                    : allDonationsResponseModel
                                                                .data![index]
                                                                .categoryId ==
                                                            7
                                                        ? const Icon(
                                                            Icons.yard,
                                                            color: white,
                                                            size: 20.0,
                                                          )
                                                        : null,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            allDonationsResponseModel.data![index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: white,
                                fontSize: 16),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            allDonationsResponseModel
                                .data![index].shortDescription,
                            style: const TextStyle(
                                color: white, fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                    ))),
          );
        });
  }

  showPaymentDialog(int id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            backgroundColor: white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Center(
                      child: Text('Donate',
                          style: TextStyle(
                              fontFamily: "Abeat",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 2,
                              color: Colors.green))),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  labelText: 'Name (Optional)',
                                  hintText: 'eg. +26377xxxxxxx'),
                              onSaved: (val) {}),
                          TextFormField(
                              controller: amountController,
                              decoration: const InputDecoration(
                                  labelText: 'Amount in RTGS',
                                  hintText: 'eg. 500'),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              onSaved: (val) {}),
                          TextFormField(
                              controller: accountNumberController,
                              decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  hintText: 'eg. 077xxxxxxx'),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              onSaved: (val) {}),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BACK',
                              style: TextStyle(
                                  color: Color.fromRGBO(52, 131, 39, 1),
                                  fontSize: 15)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(width: 16),
                        BlocConsumer<PaymentsBloc, PaymentsState>(
                          listener: (context, state) {
                            if (state is PaymentErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text('Payment Failed ${state.error}')));
                            }

                            if (state is PaymentLoadedState) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Payment Successful'),
                                backgroundColor: mainColor,
                              ));
                            }
                          },
                          builder: (context, state) {
                            if (state is PaymentLoadingState) {
                              return Column(
                                children: [
                                  CircularProgressIndicator(
                                    key: widget.key,
                                  ),
                                  const Text(
                                    'Initiating payment...',
                                    style: TextStyle(color: mainColor),
                                  )
                                ],
                              );
                            } else {
                            return TextButton(
                              onPressed: () {

                                BlocProvider.of<PaymentsBloc>(context).add(
                                  MakePaymentEvent(
                                    paymentModel: PaymentModel(
                                      accountNumber: accountNumberController.text,
                                      amount: int.parse(amountController.text),
                                      donationId:  id,
                                      name: nameController.text,
                                      paymentMethod: 1 ),
                                    
                                    )
                                );
                              },
                              style: TextButton.styleFrom(
                                primary: const Color.fromRGBO(52, 131, 39, 1),
                                backgroundColor:
                                    const Color.fromRGBO(52, 131, 39, 1),
                                onSurface: const Color.fromRGBO(52, 131, 39, 1),
                              ),
                              child: const Text(
                                'Donate',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            );
                          }}
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

import 'package:crowdfunding_mobile/blocs/donations_categories_bloc/donations_categories_bloc.dart';
import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:crowdfunding_mobile/data/models/donation_by_category_model.dart';
import 'package:crowdfunding_mobile/ui/profile_page.dart';
import 'package:crowdfunding_mobile/widgets/loader.dart';
import 'package:crowdfunding_mobile/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonationCategoriesPage extends StatefulWidget {
  const DonationCategoriesPage({ Key? key }) : super(key: key);

  @override
  _DonationCategoriesPageState createState() => _DonationCategoriesPageState();
}

class _DonationCategoriesPageState extends State<DonationCategoriesPage> {


    @override
  void initState() {
    BlocProvider.of<DonationsCategoriesBloc>(context).add(FetchDonationsCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Donation Categories'),
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
        // automaticallyImplyLeading: false,
      ),
      body: Container(
        color: white,
        child: BlocConsumer<DonationsCategoriesBloc, DonationsCategoriesState>(
          listener: (context, state) {
            if (state is DonationsCategoriesErrorState) {
              Center(child: Text(state.error));
            }
          },
          builder: (context, state) {
            if (state is DonationsCategoriesLoadingState) {
              return Loader(
                key: widget.key,
              );
            }
            if (state is DonationsCategoriesLoadedState) {
              double height = MediaQuery.of(context).size.height;
              return Container(
                child: _buildDonationCategoriesList(state.donationsCategoryResponseModel),
              );
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb5()

    );
  }

  _buildDonationCategoriesList(DonationsCategoryResponseModel donationsCategoryResponseModel){
    return ListView.builder(
      itemCount: donationsCategoryResponseModel.data!.length,
      itemBuilder: (context, index){
          return Container(
            padding: const EdgeInsets.only(
              top: 5,
              left: 7,
              right: 7
            ),
             child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     PageTransition(
                //       child: ProfilePage(
                //         productId: productsResPonseModel[index].id,
                //         key: widget.key,
                //         userType: widget.userType,
                //       ),
                //       type: PageTransitionType.leftToRight,
                //     ));
              },
              child: donationsCategoryResponseModel.data![index].categoryName == "Business" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.business,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) :

                  donationsCategoryResponseModel.data![index].categoryName == "Business" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.business,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) :

                    donationsCategoryResponseModel.data![index].categoryName == "Medical" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.medical_services,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) :

                    donationsCategoryResponseModel.data![index].categoryName == "Non-Profit" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.cake,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) :

                    donationsCategoryResponseModel.data![index].categoryName == "Education" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.school,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) :

                    donationsCategoryResponseModel.data![index].categoryName == "Community" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.people,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) :

                    donationsCategoryResponseModel.data![index].categoryName == "Politics" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.flag,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) :

                     donationsCategoryResponseModel.data![index].categoryName == "Memorial" ? Card(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        // side: const BorderSide(
                        //   // color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.yard,
                                color: white,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              donationsCategoryResponseModel.data![index].categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ) 




                    : null

             )   );
      }
      );
  }
}
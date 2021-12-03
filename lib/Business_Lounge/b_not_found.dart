import 'package:airportcart/Business_Lounge/b_choose_location.dart';
import 'package:flutter/material.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';

class BusinessNotFound extends StatefulWidget {
  @override
  _BusinessNotFoundState createState() => _BusinessNotFoundState();
}

class _BusinessNotFoundState extends State<BusinessNotFound> {
  TextEditingController search = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Business Lounge',
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // searchbar(
                    //   context: context,
                    //   controller: search,
                    //   hint: 'Resturant Name...',
                    //   onTap: () {},
                    // ),
                    searchFood(
                      controller: location,
                      hint: 'Enter Location',
                      color: AppData.bgColor,
                      prefixicon: Icon(
                        Icons.location_on_outlined,
                        color: AppData.primary,
                      ),
                      ontap: () {},
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 350,
                      width: 350,
                      child: Image(
                        image: AssetImage(Strings.nodata),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    customButton(
                      title: 'Choose Location',
                      margin: 50,
                      textColor: AppData.white,
                      radius: 25,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BusinessChooseLocation()));
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

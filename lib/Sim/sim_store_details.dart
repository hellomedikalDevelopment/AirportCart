import 'dart:ui';

import 'package:airportcart/Sim/simcard_details.dart';
import 'package:airportcart/Sim/store_location.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class SimStoreDetails extends StatefulWidget {
  @override
  _SimStoreDetailsState createState() => _SimStoreDetailsState();
}

class _SimStoreDetailsState extends State<SimStoreDetails> {
  TextEditingController search = TextEditingController();
  var favorite;
  String selectCategory = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Sim Cards',
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios_rounded,
            // trailing: Icons.filter_list_rounded,
            // onPressed: () {
            //   filter();
            // }
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: appText(
                              title: 'Current',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: AppData.primary),
                              SizedBox(width: 8),
                              appText(
                                  title: 'Airport USA, Birmingham T-7',
                                  color: AppData.primary),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios_outlined,
                                  color: AppData.primary, size: 14),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return businessLounge();
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget businessLounge() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppData.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
              child: Image.asset(
                Strings.minnow,
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 1,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText(
                      title: 'Airtel Store',
                      fontWeight: FontWeight.w500,
                      color: AppData.primary,
                      fontSize: 16),
                  SizedBox(height: 8),
                  appText(
                      title: 'Terminal 1',
                      fontWeight: FontWeight.w500,
                      color: AppData.greyDark,
                      fontSize: 14),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on_outlined,
                          color: AppData.primary, size: 30),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: appText(
                            title: '13 Shop No. Birmingham Airport',
                            fontWeight: FontWeight.w500,
                            color: AppData.greyDark,
                            fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SimStoreLocation()));
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: AppData.primary,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(Icons.arrow_forward_ios,
                              size: 16, color: AppData.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  customButton(
                    title: 'See All Sim Details',
                    radius: 25,
                    onTap: () {
                      // getLocation();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SimCardDetails()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

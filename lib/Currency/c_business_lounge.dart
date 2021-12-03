import 'dart:ui';

import 'package:airportcart/Currency/currency_exchange.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class CurrencyBusinessLoungePage extends StatefulWidget {
  @override
  _CurrencyBusinessLoungePageState createState() =>
      _CurrencyBusinessLoungePageState();
}

class _CurrencyBusinessLoungePageState
    extends State<CurrencyBusinessLoungePage> {
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
            title: 'Business Lounge',
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
                      title: 'Travelex Currency Exchange',
                      fontWeight: FontWeight.w500,
                      color: AppData.primary,
                      fontSize: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //
                  //     Row(
                  //       children: [
                  //         Icon(Icons.star_rate_rounded,
                  //             color: Colors.yellow, size: 18),
                  //         appText(title: '5.0(230 Review)', fontSize: 14),
                  //       ],
                  //     )
                  //   ],
                  // ),
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
                                  builder: (context) =>
                                      CurrencyExchangeLocation()));
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
                  // appText(
                  //   title: '\$65.00/Per Hours',
                  //   fontWeight: FontWeight.w500,
                  //   color: AppData.primary,
                  //   fontSize: 14,
                  // ),
                  SizedBox(height: 15),
                  customButton(
                    title: 'Direct Call',
                    radius: 25,
                    onTap: () {
                      // getLocation();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => OpenSetting()));
                    },
                  ),
                  // buttonSearchList(
                  //     name: 'See Details',
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => AboutBusinessLounge()));
                  //     }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filter() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 20, 15),
            decoration: BoxDecoration(
              color: AppData.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              boxShadow: [
                new BoxShadow(
                  // color: AppData.mainblue,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: appText(
                      title: 'Select Filter Options',
                      color: AppData.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                SizedBox(height: 20),
                Container(
                  // height: 65,
                  padding: EdgeInsets.all(10),
                  // width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    physics: BouncingScrollPhysics(),
                    children: List.generate(categoryList.length, (i) {
                      return categoryShow(categoryList, i);
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget categoryShow(category, i) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: InkWell(
            onTap: () {
              setState(() {
                selectCategory = category[i]['id'];
              });
            },
            child: Container(
              // height: 35,
              // width: 100,
              decoration: BoxDecoration(
                color: (selectCategory == category[i]['id'])
                    ? AppData.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppData.primary,
                  // style: BorderStyle.solid,
                  width: 0.5,
                ),
              ),
              child: Center(
                child: appText(
                  title: category[i]['category'],
                  fontSize: 14,
                  color: (selectCategory == category[i]['id'])
                      ? AppData.white
                      : AppData.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> categoryList = [
    {'id': '0', 'category': 'Terminal 1'},
    {'id': '1', 'category': 'Terminal 2'},
    {'id': '2', 'category': 'Terminal 3'},
    {'id': '3', 'category': 'Terminal 4'},
    {'id': '4', 'category': 'Terminal 5'},
  ];
}

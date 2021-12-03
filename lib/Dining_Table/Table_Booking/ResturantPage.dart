import 'dart:ui';

import 'package:airportcart/Dining_Table/Table_Booking/About_Resturant.dart';
import 'package:airportcart/Dining_Table/Table_Booking/Resturant_Search_Page.dart';
import 'package:airportcart/Dining_Table/Table_Booking/SeeAll_Resturant_Page.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class ResturantPage extends StatefulWidget {
  @override
  _ResturantPageState createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {
  TextEditingController search = TextEditingController();
  var favorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Resturant',
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded),
          searchbar(
            context: context,
            controller: search,
            suffiximage: Padding(
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                child: Image(
                  image: AssetImage(Strings.microphone),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResturantSearchPage()));
                },
              ),
            ),
            hint: 'Resturant Name...',
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
                              Icon(
                                Icons.location_on_outlined,
                                color: AppData.primary,
                              ),
                              SizedBox(width: 8),
                              appText(
                                title: 'Airport USA, Birmingham T-7',
                                color: AppData.primary,
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppData.primary,
                                size: 14,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    child: appText(
                      title: 'Select Category',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: allproducts(),
                    ),
                  ),
                  rowline(
                    title: 'Recomended Resturants',
                    subtitle: 'See All',
                    onTap: () {},
                  ),
                  Container(
                    height: 230,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return title(assetsList, i);
                      },
                    ),
                  ),
                  rowline(
                    title: 'All Resturant',
                    subtitle: 'See All',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeeAllResturantPage()));
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return resturantView();
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

  Widget title(assetsList, i) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Stack(
        children: [
          Container(
            width: 175,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        image: AssetImage(assetsList[i]['image']),
                        fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText(
                            title: assetsList[i]['name'],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.5,
                          ),
                          SizedBox(height: 5),
                          appText(
                              title: assetsList[i]['subtitle'],
                              color: Colors.black54),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 3),
                              appText(title: assetsList[i]['rating']),
                              SizedBox(width: 3),
                              appText(
                                title: assetsList[i]['review'],
                                color: Colors.black54,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  favorite = assetsList[i]['id'];
                });
              },
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    favorite != assetsList[i]['id']
                        ? Icons.favorite_border
                        : Icons.favorite,
                    color: AppData.primary,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget allproducts() {
    return GridView.count(
      padding: EdgeInsets.all(0),
      crossAxisCount: 3,
      childAspectRatio: 1.1,
      crossAxisSpacing: 1,
      mainAxisSpacing: 4,
      children: List.generate(foodList.length, (i) {
        return GestureDetector(
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child:
                      Image.asset(foodList[i]['image'], height: 70, width: 70),
                ),
                SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodList[i]['name'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget resturantView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.34,
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                    image: AssetImage(Strings.minnow), fit: BoxFit.fill),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                        title: 'Minnow Restrant Food King',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      SizedBox(height: 4),
                      appText(
                        title: 'Chinese Food',
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded,
                              color: Colors.yellow[700]),
                          appText(
                            title: '5.0 (230 Review)',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutResturantPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppData.primary),
                      child: Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> assetsList = [
    {
      'id': 0,
      'image': Strings.cafe,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '5.0',
      'review': '(210 review)',
    },
    {
      'id': 1,
      'image': Strings.kfc,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '4.0',
      'review': '(200 review)',
    },
    {
      'id': 2,
      'image': Strings.cafe,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '3.0',
      'review': '(215 review)',
    },
    {
      'id': 3,
      'image': Strings.kfc,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '2.0',
      'review': '(225 review)',
    },
    {
      'id': 4,
      'image': Strings.cafe,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '5.0',
      'review': '(80 review)',
    },
    {
      'id': 5,
      'image': Strings.kfc,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '5.0',
      'review': '(1 review)',
    },
    {
      'id': 6,
      'image': Strings.cafe,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '3.0',
      'review': '(88 review)',
    },
    {
      'id': 7,
      'image': Strings.kfc,
      'name': 'Cafe Bistro',
      'subtitle': 'Austrailian Food',
      'rating': '4.0',
      'review': '(44 review)',
    },
  ];
  List<Map<String, dynamic>> foodList = [
    {
      'image': Strings.italian,
      'name': 'Italian ',
    },
    {
      'image': Strings.indian,
      'name': 'Indian',
    },
    {
      'image': Strings.japanese,
      'name': 'Japanese',
    },
    {
      'image': Strings.fresh,
      'name': 'French',
    },
    {
      'image': Strings.contenental,
      'name': 'Continental',
    },
    {
      'image': Strings.mediterranean,
      'name': 'Mediterranean',
    },
  ];
}

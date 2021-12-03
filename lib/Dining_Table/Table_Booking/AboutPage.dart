import 'package:airportcart/Dining_Table/Table_Booking/Booking_Details_Page.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var favorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 14),
            appText(
              title:
                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words',
              maxLines: 5,
              letterSpacing: 0.5,
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.topRight,
              child: appText(
                title: 'See More',
                color: AppData.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: appText(
                title: 'Facilities',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 14),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: foodList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return facilities(foodList, i);
                },
              ),
            ),
            rowline(
              title: 'Similar Resturants ',
              subtitle: 'See All',
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => SeeAllResturantPage()));
              },
            ),
            //
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
            SizedBox(height: 20),
            customButton(
              title: 'Book Now',
              margin: 5,
              textColor: Colors.white,
              radius: 8,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookingDetailsPage()));
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget facilities(foodList, i) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image(
                image: AssetImage(foodList[i]['image']),
              ),
            ),
            SizedBox(height: 8),
            appText(
              title: foodList[i]['name'],
              color: Colors.grey,
            )
          ],
        ));
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

  List<Map<String, dynamic>> foodList = [
    {
      'image': Strings.tables,
      'name': '20 Tables ',
    },
    {
      'image': Strings.chefs,
      'name': 'Expert Chefs',
    },
    {
      'image': Strings.food,
      'name': 'Delicious Foods',
    },
    {
      'image': Strings.peaceful,
      'name': 'Peaceful',
    },
  ];
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
}

import 'package:airportcart/Business_Lounge/b_booking_details.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class BusinessAboutPage extends StatefulWidget {
  @override
  _BusinessAboutPageState createState() => _BusinessAboutPageState();
}

class _BusinessAboutPageState extends State<BusinessAboutPage> {
  var favorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14),
            appText(
              title:
                  'Relax at the Lufthansa Business Lounge prior to your departure from Paris. Enjoy a comfortable, peaceful, and modern environment away from the terminal\'s hustle and bustle. Imbibe at the well-stocked self-serve bar and..',
              maxLines: 5,
              color: AppData.greyDark,
              fontSize: 12,
              height: 1.5,
              letterSpacing: 0.5,
            ),
            SizedBox(height: 8),
            Container(
              alignment: Alignment.bottomRight,
              child: appText(
                  title: 'See More',
                  color: AppData.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            Divider(height: 30),
            appText(
                title: 'Top Complimentary Amenities',
                fontWeight: FontWeight.w500,
                color: AppData.black,
                fontSize: 16),
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
            Divider(height: 30),
            appText(
                title: 'Price Rate',
                fontWeight: FontWeight.w500,
                color: AppData.black,
                fontSize: 16),
            SizedBox(height: 15),
            appText(
                title: '\$65.00/Per Hours',
                fontWeight: FontWeight.w500,
                color: AppData.primary,
                fontSize: 16),
            Divider(height: 30),
            appText(
                title: 'Important Information',
                fontWeight: FontWeight.w500,
                color: AppData.black,
                fontSize: 16),
            SizedBox(height: 15),
            infoDetails(context,
                icon: Icons.circle,
                size: 8,
                detail:
                    'Children under 2 years old are admitted free with an adult.'),
            infoDetails(context,
                icon: Icons.circle,
                size: 8,
                detail:
                    'This location does not accept passengers in airline uniforms.'),
            infoDetails(context,
                icon: Icons.circle,
                size: 8,
                detail:
                    'This lounge is only accessible to passengers departing from Gates 60-68 in Terminal 1.'),
            Divider(height: 30),
            appText(
                title: 'Cancellation Policy',
                fontWeight: FontWeight.w500,
                color: AppData.black,
                fontSize: 16),
            SizedBox(height: 15),
            infoDetails(context,
                icon: Icons.done_rounded,
                size: 16,
                detail:
                    'Cancel up to 24 hours prior to your booking time to get a full refund.'),
            infoDetails(context,
                icon: Icons.done_rounded,
                size: 16,
                detail:
                    'You may enter the lounge one hour before or after your booked time. Your booking starts upon entry.'),

            SizedBox(height: 20),
            customButton(
              title: 'Book Now',
              margin: 5,
              textColor: AppData.white,
              radius: 8,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BusinessBookingDetails()));
              },
            ),
            SizedBox(height: 20),
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
              color: AppData.grey,
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
              color: AppData.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(color: AppData.grey, blurRadius: 1, spreadRadius: 1)
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
                      color: AppData.white,
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
      'image': Strings.group_7541,
      'name': 'Food',
    },
    {
      'image': Strings.group_7543,
      'name': 'Wi-Fi',
    },
    {
      'image': Strings.group_7545,
      'name': 'Beer & Wine',
    },
    {
      'image': Strings.group_7547,
      'name': 'Flight Monitors',
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

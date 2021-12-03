import 'package:airportcart/Business_Lounge/b_booking_details.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

import '../app_widget/app_data.dart';

class BusinessReviewsPage extends StatefulWidget {
  @override
  _BusinessReviewsPageState createState() => _BusinessReviewsPageState();
}

class _BusinessReviewsPageState extends State<BusinessReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: reviewList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return review(reviewList, i);
              },
            ),
            SizedBox(height: 10),
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

  Widget review(reviewList, i) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  reviewList[i]['image'],
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText(
                    title: reviewList[i]['name'],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 3),
                  Image.asset(reviewList[i]['rate'], height: 16),
                ],
              )
            ],
          ),
          SizedBox(height: 8),
          appText(
            title: reviewList[i]['des'],
            color: AppData.grey,
            letterSpacing: 0.5,
            height: 1.5,
            maxLines: 5,
          ),
          SizedBox(height: 8),
          appText(
            title: reviewList[i]['date'],
            fontWeight: FontWeight.w500,
          ),
          // Divider(),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> reviewList = [
    {
      'image': Strings.user,
      'rate': Strings.star4,
      'name': 'Laura Octavian',
      'date': 'May 07, 2021',
      'des':
          'This is really amazing product, i like the design of product, I hope can buy it again!',
    },
    {
      'image': Strings.user,
      'rate': Strings.star5,
      'name': 'Jhonson Bridge',
      'date': 'May 06, 2016',
      'des':
          'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit',
    },
    {
      'image': Strings.user,
      'rate': Strings.star4,
      'name': 'Laura Octavian',
      'date': 'May 07, 2021',
      'des':
          'This is really amazing product, i like the design of product, I hope can buy it again!',
    },
  ];
}

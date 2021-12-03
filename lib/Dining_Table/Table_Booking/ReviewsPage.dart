import 'package:airportcart/Dining_Table/Table_Booking/Booking_Details_Page.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return review();
              },
            ),
            SizedBox(height: 10),
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

  Widget review() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Image(
                image: AssetImage(Strings.profile),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: 'Laura Octavian',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 3),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 8),
        appText(
          title:
              'This is really amazing product, i like the design of product, I hope can buy it again!',
          color: Colors.grey,
          letterSpacing: 0.5,
          maxLines: 5,
        ),
        SizedBox(height: 8),
        appText(
          title: 'May 06, 2016',
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 5),
        Divider(),
      ],
    );
  }
}

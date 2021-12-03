import 'package:airportcart/Dining_Table/Table_Booking/Booking_Details_Page.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class FoodMenuPage extends StatefulWidget {
  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            expansionTile(
              title: 'Starter',
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: assetsList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return starter(assetsList, i);
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            expansionTile(
              title: 'Appitizer',
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return starter(assetsList, i);
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            expansionTile(
              title: 'Fries',
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return starter(assetsList, i);
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            expansionTile(
              title: 'Mexican',
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return starter(assetsList, i);
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            expansionTile(
              title: 'Burgers',
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return starter(assetsList, i);
                  },
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
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

  Widget starter(data, i) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.shade400, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(data[i]['image'])),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                appText(
                  title: data[i]['name'],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                SizedBox(height: 5),
                appText(title: data[i]['price']),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 3),
                appText(title: data[i]['rating']),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget expansionTile({
    String title,
    List<Widget> children,
  }) {
    return ListTileTheme(
      tileColor: Colors.white,
      child: ExpansionTile(
        title: Text(title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500)),
        children: children,
      ),
    );
  }

  List<Map<String, dynamic>> assetsList = [
    {
      'id': 0,
      'image': Strings.burger,
      'name': 'Double Whooper',
      'price': '\$10.50',
      'rating': '5.0',
    },
    {
      'id': 1,
      'image': Strings.burger,
      'name': 'Double Whooper',
      'price': '\$15.50',
      'rating': '4.0',
    },
    {
      'id': 2,
      'image': Strings.burger,
      'name': 'Double Whooper',
      'price': '\$20.50',
      'rating': '3.0',
    },
    {
      'id': 3,
      'image': Strings.burger,
      'name': 'Double Whooper',
      'price': '\$30.00',
      'rating': '2.0',
    },
    {
      'id': 4,
      'image': Strings.burger,
      'name': 'Double Whooper',
      'price': '\$10.99',
      'rating': '5.0',
    },
  ];
}

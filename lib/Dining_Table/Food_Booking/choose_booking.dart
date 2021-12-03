import 'package:airportcart/Dining_Table/Food_Booking/restaurant.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class ChooseBookingPage extends StatefulWidget {
  @override
  _ChooseBookingPageState createState() => _ChooseBookingPageState();
}

class _ChooseBookingPageState extends State<ChooseBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Select Booking',
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText(
                    title: 'Choose Any One For Booking',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 20),
                  listTile(
                    image: Strings.dineIn,
                    title: 'Dine In',
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  listTile(
                    image: Strings.takeaway,
                    title: 'Take Away',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantPage()));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listTile({String image, String title, Function onTap}) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [BoxShadow(color: Colors.black38)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
                // color: AppData.primery,
                child: Image.asset(image),
              ),
              SizedBox(width: 10),
              appText(
                title: title,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppData.primary,
              ),
              child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:airportcart/Dining_Table/Table_Booking/Enable_Location.dart';
import 'package:airportcart/Dining_Table/Table_Booking/NoDataFound.dart';
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
                  Container(
                    width: 200,
                    child: appText(
                      title: 'Choose Any One For Booking',
                      maxLines: 2,
                      fontSize: 22,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  listTile(
                    image: Strings.dinein,
                    title: 'Dine In',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnableLocation()));
                    },
                  ),
                  SizedBox(height: 20),
                  listTile(
                    image: Strings.takeaway,
                    title: 'Take Away',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoDataFound()));
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
      height: 120,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
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

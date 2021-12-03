import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class CompleteTabaleBookingPage extends StatefulWidget {
  @override
  _CompleteTabaleBookingPageState createState() =>
      _CompleteTabaleBookingPageState();
}

class _CompleteTabaleBookingPageState extends State<CompleteTabaleBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Center(
            child: Image(
              image: AssetImage(Strings.congretulation),
              height: 300,
              width: 300,
            ),
          ),
          SizedBox(height: 15),
          appText(
            title: 'Congratulation!!!',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          SizedBox(height: 10),
          appText(
            title: 'Order Number - IW3475453455',
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'You have booked a table in ',
                style: TextStyle(
                  fontFamily: themeFont,
                  color: Color(0x73000000),
                  letterSpacing: 0.5,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'The Minnow Restrant Food Kingon ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: AppData.primary,
                      letterSpacing: 0.5,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        '26th May 2021 at 08:00 PM Booking Information sent on your email.',
                    style: TextStyle(
                      fontFamily: themeFont,
                      color: Color(0x73000000),
                      letterSpacing: 0.5,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          customButton(
            title: 'Check Order History',
            margin: 50,
            textColor: Colors.white,
            radius: 10,
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => PaymentProssesPage()));
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
// You have booked a table in The Minnow Restrant Food Kingon 26th May 2021 at 08:00 PM
// Booking Information sent on your email.
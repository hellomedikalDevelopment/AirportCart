import 'package:flutter/material.dart';

import '../My_Home_Page.dart';
import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class CompleteShoppingPage extends StatefulWidget {
  @override
  _CompleteShoppingPageState createState() => _CompleteShoppingPageState();
}

class _CompleteShoppingPageState extends State<CompleteShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Center(
            child: Image(
              image: AssetImage(Strings.bags),
              height: 300,
              width: 300,
            ),
          ),
          SizedBox(height: 15),
          appText(
            title: 'Success!',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Please visit at ',
                style: TextStyle(
                  fontFamily: themeFont,
                  color: AppData.greyDark,
                  letterSpacing: 0.5,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'USA, Birmingham T-7 ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: AppData.primary,
                      letterSpacing: 0.5,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'and collect you delivery products...',
                    style: TextStyle(
                      fontFamily: themeFont,
                      color: AppData.greyDark,
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
            textColor: AppData.white,
            radius: 10,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

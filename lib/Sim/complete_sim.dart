import 'package:airportcart/My_Home_Page.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class CompleteSimPage extends StatefulWidget {
  @override
  _CompleteSimPageState createState() => _CompleteSimPageState();
}

class _CompleteSimPageState extends State<CompleteSimPage> {
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
                text: 'You have booked a ',
                style: TextStyle(
                  fontFamily: themeFont,
                  color: AppData.greyDark,
                  letterSpacing: 0.5,
                  height: 1.5,
                  fontSize: 12,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sim Card in (USA, Birmingham T-7) ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: AppData.primary,
                      height: 1.5,
                      letterSpacing: 0.5,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text:
                        '21st june 2021 at 03:23 AM ,Your document is checking under Processing, After verify your document , we will sent confirmation mail on your email.',
                    style: TextStyle(
                      fontFamily: themeFont,
                      color: AppData.greyDark,
                      letterSpacing: 0.5,
                      height: 1.5,
                      fontSize: 12,
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

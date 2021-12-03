import 'package:airportcart/Business_Lounge/b_aboutpage.dart';
import 'package:airportcart/Business_Lounge/b_reviewspage.dart';
import 'package:flutter/material.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';

class AboutBusinessLounge extends StatefulWidget {
  @override
  _AboutBusinessLoungeState createState() => _AboutBusinessLoungeState();
}

class _AboutBusinessLoungeState extends State<AboutBusinessLounge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainImage(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(
                        title: 'Lufthansa Business Lounge',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppData.black,
                        letterSpacing: 0.5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                            ),
                            appText(title: '5.0', fontSize: 16)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: AppData.grey),
                          appText(
                            title: 'USA, Birmingham T-7',
                            fontSize: 14,
                            color: AppData.grey,
                          )
                        ],
                      ),
                      appText(
                        title: 'Open 24*7 Hours',
                        fontSize: 12,
                        color: AppData.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body(),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height * 0.8,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 50,
              centerTitle: true,
              elevation: 0,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                indicatorWeight: 2,
                unselectedLabelColor: AppData.grey,
                indicatorColor: AppData.primary,
                labelColor: AppData.primary,
                labelStyle: TextStyle(color: AppData.grey),
                tabs: [
                  Tab(
                    child: appText(
                      title: 'About',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Tab(
                  //   child: appText(
                  //     title: 'Food Menu',
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Tab(
                    child: appText(
                      title: 'Reviews',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                BusinessAboutPage(),
                // FoodMenuPage(),
                BusinessReviewsPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mainImage() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          decoration: BoxDecoration(
            color: AppData.green,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage(Strings.book), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 26,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded,
                        color: AppData.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  appText(
                      title: 'Lufthansa Business Lounge',
                      color: AppData.white,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500)
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 300,
          left: 150,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image:
                    DecorationImage(image: AssetImage(Strings.communication))),
          ),
        ),
      ],
    );
  }
}

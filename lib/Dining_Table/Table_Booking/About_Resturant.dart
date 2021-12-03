import 'package:flutter/material.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/Dining_Table/Table_Booking/AboutPage.dart';
import 'package:airportcart/Dining_Table/Table_Booking/ReviewsPage.dart';
import 'package:airportcart/Dining_Table/Table_Booking/Food_Menu_Page.dart';

class AboutResturantPage extends StatefulWidget {
  @override
  _AboutResturantPageState createState() => _AboutResturantPageState();
}

class _AboutResturantPageState extends State<AboutResturantPage> {
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
                        title: 'Minnow Restrant Food King',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
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
                          Icon(Icons.location_on_outlined, color: Colors.grey),
                          appText(
                            title: 'USA, Birmingham T-7',
                            fontSize: 14,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      appText(
                        title: 'Open 24*7 Hours',
                        fontSize: 12,
                        color: Colors.teal,
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
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 50,
              centerTitle: true,
              elevation: 0,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                indicatorWeight: 3,
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(color: Colors.grey),
                indicatorColor: AppData.primary,
                labelColor: AppData.primary,
                labelStyle: TextStyle(color: Colors.grey),
                tabs: [
                  Tab(
                    child: appText(
                      title: 'About',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Tab(
                    child: appText(
                      title: 'Food Menu',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                AboutPage(),
                FoodMenuPage(),
                ReviewsPage(),
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
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
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
                    icon:
                        Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  appText(
                    title: 'Minnow Restrant Food King',
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                  )
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

import 'package:airportcart/Shopping_Experience/brand_detail.dart';
import 'package:flutter/material.dart';

import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<String> imagesList = [
    Strings.electronics,
    Strings.footwear,
    Strings.jewellery,
    Strings.beauty_product,
    Strings.clothes,
    Strings.fregrances,
    Strings.bakery_items,
    Strings.books,
    Strings.tabacco,
    Strings.wine_spirits,
  ];
  List<String> listName = [
    'Electronics',
    'Footwear',
    'Jewellery',
    'Beauty Product',
    'Cloths',
    'Fregrances',
    'Bakery Item',
    'Books',
    'Tabacco',
    'Wine & Spirits',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'USA, Birmingham T-7',
              icon: Icons.arrow_back_ios,
              onTab: () {
                Navigator.pop(context);
              },
              onPressed: () {},
              trailing: Icons.search),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: appText(
              title: 'Categories',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppData.black,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: doctorList(),
            ),
          )
        ],
      ),
    );
  }

  Widget doctorList() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 0.85,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: List.generate(imagesList.length, (i) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BrandDetail()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  imagesList[i],

                ),
              ),
              // Container(
              //
              //   child: widget(
              //     child: Image.asset(
              //       imagesList[i],
              //       height: 70,
              //       width: 70,
              //     ),
              //   ),
              // ),
              SizedBox(height: 5),
              appText(
                title: listName[i],
                fontSize: 14,
                color: AppData.black,
              ),
            ],
          ),
        );
      }),
    );
  }
}

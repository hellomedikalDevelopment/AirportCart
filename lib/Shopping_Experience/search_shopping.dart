import 'package:airportcart/Shopping_Experience/shopping.dart';
import 'package:flutter/material.dart';
import 'package:search_map_place/search_map_place.dart';

import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class SearchShopping extends StatefulWidget {
  @override
  _SearchShoppingState createState() => _SearchShoppingState();
}

class _SearchShoppingState extends State<SearchShopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            statusBar(context),
            customMainAppBar(
                title: 'Shopping',
                icon: Icons.arrow_back_ios,
                onTab: () {
                  Navigator.pop(context);
                }),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Shopping()));
              },
              child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 30,
                            color: AppData.grey,
                          )),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            appText(
                              title: 'Currant Location',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppData.black,
                            ),
                            SizedBox(height: 5),
                            appText(
                                title: 'Provide your current location',
                                fontSize: 14,
                                color: AppData.grey),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchMapPlaceWidget(
                hasClearButton: true,
                iconColor: AppData.grey,
                icon: Icons.my_location_rounded,
                strictBounds: true,
                placeType: PlaceType.address,
                placeholder: 'Enter Location',
                apiKey: 'AIzaSyDtL6TcIUKEUKnYY69ymmIX8r_8qpk9fJg',
                onSelected: (Place place) async {},
              ),
            ),
            // searchFood(title: 'Search', hint: 'Search'),
          ],
        ),
      ),
    );
  }
}

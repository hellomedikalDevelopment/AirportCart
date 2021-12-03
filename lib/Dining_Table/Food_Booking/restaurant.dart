import 'dart:ui';
import 'package:airportcart/Dining_Table/Food_Booking/change_location.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  TextEditingController searchResturant = TextEditingController();
  final controller = TextEditingController();
  String streetNumber = '';
  String street = '';
  String city = '';
  String zipCode = '';
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isshowMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppData.bgColor,
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Resturant',
            titleAlign: TextAlign.center,
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppData.primary,
            padding: EdgeInsets.all(10),
            child: kTextField(
                hint: 'Resturant Name, dish,',
                icon: Icon(
                  Icons.search,
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SearchPage()));
                },
                controller: searchResturant,
                sufixImage: IconButton(
                    icon: Icon(Icons.mic_none),
                    onPressed: () {
                      print('Speech Recognizer');
                    })),
          ),
          enterLocation(currentLocation: 'Airport USA, Birmingham T-7'),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*  Align(
                  child: Container(
                    height: 300,
                    width: 300,
                    // color: AppData.primery,
                    child: Image.asset(Strings.noData),
                  ),
                ),
                SizedBox(height: 25),
                customButton(
                  title: 'Choose Language',
                  width: MediaQuery.of(context).size.width * 0.80,
                  radius: 50,
                ),*/
                Container(
                    // height: 150,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(Strings.offerBanner)),
                SizedBox(height: 10),
                appText(
                  title: 'Eat What Makes You Happy',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: isshowMore == false ? 8 : categoryList.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 45,
                            backgroundImage:
                                AssetImage(categoryList[index]['image']),
                          ),
                          appText(
                            title: categoryList[index]['title'],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ],
                      );
                    }),
                SizedBox(height: 10),
                showMore(),
                SizedBox(height: 10),
                appText(
                  title: '43 Resturant At',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                SizedBox(height: 5),
                appText(
                  title: 'Airport USA, Birmigham T-7',
                  fontWeight: FontWeight.bold,
                  color: AppData.primary,
                  fontSize: 18,
                ),
                // SizedBox(height: 5),
                ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, listIndex) {
                      return resturantView();
                    })
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget enterLocation({String currentLocation}) {
    return InkWell(
      onTap: () async {
        // final sessionToken = Uuid().v4();
        // final Suggestion result = await Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ChangeLocationPage(sessionToken)));
        // // This will change the text displayed in the TextField
        // if (result != null) {
        //   final placeDetails = await PlaceApiProvider(sessionToken)
        //       .getPlaceDetailFromId(result.placeId);
        //   setState(() {
        //     controller.text = result.description;
        //     streetNumber = placeDetails.streetNumber;
        //     street = placeDetails.street;
        //     city = placeDetails.city;
        //     zipCode = placeDetails.zipCode;
        //   });
        // }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangeLocationPage()));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.grey.shade200,
        child: Row(
          children: [
            Icon(
              Icons.place_outlined,
              size: 28,
              color: AppData.primary,
            ),
            SizedBox(width: 8),
            appText(
              title: currentLocation ?? 'Enter Location',
              color: AppData.primary,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppData.primary,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  Widget showMore() {
    return InkWell(
      onTap: () {
        setState(() {
          if (isshowMore == false) {
            isshowMore = true;
          } else {
            isshowMore = false;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appText(
              title: isshowMore == false ? 'See More' : 'See Less',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 5),
            Icon(isshowMore == false
                ? Icons.keyboard_arrow_down_rounded
                : Icons.keyboard_arrow_up_rounded)
          ],
        ),
      ),
    );
  }

  Widget resturantView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)]),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.green,
              image: DecorationImage(
                image: AssetImage(Strings.resturant),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.21,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                      title: 'Minnow Restrant Food King',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    SizedBox(height: 5),
                    appText(
                      title: 'Pizza, Italian, Burger',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow[700],
                        ),
                        appText(
                          title: '5.0 (230 Review)',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppData.primary,
                    ),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List categoryList = [
  {
    'title': 'Pizza',
    'image': Strings.pizza,
  },
  {
    'title': 'Burger',
    'image': Strings.burger,
  },
  {
    'title': 'Rolls',
    'image': Strings.rolls,
  },
  {
    'title': 'Fries',
    'image': Strings.fries,
  },
  {
    'title': 'Biryani',
    'image': Strings.biryani,
  },
  {
    'title': 'Noodles',
    'image': Strings.noodles,
  },
  {
    'title': 'Pasta',
    'image': Strings.pasta,
  },
  {
    'title': 'Cake',
    'image': Strings.cake,
  },
  {
    'title': 'Pizza',
    'image': Strings.pizza,
  },
];

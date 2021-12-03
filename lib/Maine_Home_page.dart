import 'package:airportcart/Business_Lounge/b_enable_location.dart';
import 'package:airportcart/Currency/choose_currency.dart';
import 'package:airportcart/Dining_Table/choose_booking.dart';
import 'package:airportcart/Shopping_Experience/search_shopping.dart';
import 'package:airportcart/Sim/s_enable_location.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  List images = [
    Image.asset(
      Strings.lab1,
      fit: BoxFit.cover,
    ),
    Image.asset(
      Strings.lab2,
      fit: BoxFit.cover,
    ),
    Image.asset(
      Strings.lab3,
      fit: BoxFit.cover,
    ),
    Image.asset(
      Strings.lab3,
      fit: BoxFit.cover,
    ),
  ];
  List<String> imagesList = [
    Strings.flightinfo,
    Strings.businesslounge,
    Strings.diningfood,
    Strings.shopping,
    Strings.relaxing,
    Strings.customerservice,
    Strings.airportservice,
    Strings.dealsservice,
  ];
  List<String> listName = [
    'Upload Flight info.',
    'Business Lounge',
    'Dining & Food Booking',
    'Shopping',
    'Coustomer Service',
    'Relaxing',
    'Airport Service',
    'Deals & Specials',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customAppBar(
            profile: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: AppData.primary,
                  borderRadius: BorderRadius.circular(50)),
            ),
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.sort,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    searchFood(
                      controller: search,
                      hint: 'Search...',
                      suffixicon: Icon(
                        Icons.mic,
                        color: AppData.grey,
                      ),
                      prefixicon: Icon(
                        Icons.search_outlined,
                        color: AppData.grey,
                      ),
                      ontap: () {},
                    ),
                    SizedBox(height: 10),
                    cursorImage(),
                    SizedBox(height: 15),
                    gridView(),
                    SizedBox(height: 15),
                    otherService(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget otherService() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.94,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            appText(
                title: 'Other Services',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                fontStyle: FontStyle.italic),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseCurrencyPage()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppData.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image(
                            image: AssetImage(Strings.currency),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    appText(
                      title: 'Currency',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppData.white,
                      letterSpacing: 0.5,
                    )
                  ],
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: 1,
                    color: AppData.white),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SimEnableLocation()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppData.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image(
                            image: AssetImage(Strings.sim),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    appText(
                      title: 'Sims',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppData.white,
                      letterSpacing: 0.5,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget gridView() {
    return Container(
      height: 620,
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(3),
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listName.length,
        staggeredTileBuilder: (listName) =>
            StaggeredTile.count(2, listName.isEven ? 2.1 : 1.5),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        itemBuilder: (BuildContext context, i) => GestureDetector(
          onTap: () {
            print('listname:${listName[i]}');
            if (i == 0) {
              //! Upload Flight info.
              print('listname:$i');
              print('listname:${listName[i]}');

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => FindDoctorPage()));
            } else if (i == 1) {
              //! Business Lounge
              print('listname:$i');
              print('listname:${listName[i]}');

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BusinessEnableLocation()));
            } else if (i == 2) {
              //! Dining & Food Booking
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChooseBookingPage()));
            } else if (i == 3) {
              //! Shopping
              print('listname:$i');
              print('listname:${listName[i]}');

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchShopping()));
            } else if (i == 4) {
              //! Coustomer Service
              print('listname:$i');
              print('listname:${listName[i]}');

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => TDashboard()));
            } else if (i == 5) {
              //! Relaxing
              print('listname:$i');
              print('listname:${listName[i]}');

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => MedicalServices()));
            } else if (i == 6) {
              //! Airport Service
              print('listname:$i');
              print('listname:${listName[i]}');

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => MedicalServices()));
            } else if (i == 7) {
              //! Deals & Specials
              print('listname:$i');
              print('listname:${listName[i]}');

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => MedicalServices()));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppData.green,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imagesList[i]), fit: BoxFit.fill),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${listName[i]}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppData.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cursorImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 170,
        child: Carousel(
          radius: Radius.circular(10),
          dotPosition: DotPosition.bottomRight,
          dotHorizontalPadding: 5,
          dotIncreasedColor: AppData.primary,
          dotBgColor: Colors.transparent,
          dotSize: 10,
          dotSpacing: 15,
          autoplay: false,
          dotColor: AppData.white,
          images: images,
        ),
      ),
    );
  }
}

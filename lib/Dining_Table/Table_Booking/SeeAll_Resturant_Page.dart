import 'package:airportcart/Dining_Table/Table_Booking/About_Resturant.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class SeeAllResturantPage extends StatefulWidget {
  @override
  _SeeAllResturantPageState createState() => _SeeAllResturantPageState();
}

class _SeeAllResturantPageState extends State<SeeAllResturantPage> {
  bool isSelected = false;
  bool italian = true;
  bool continental = false;
  bool indian = false;
  bool mediterranean = false;
  bool japanese = false;
  bool french = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'All Resturant',
              image: GestureDetector(
                onTap: priceFilter,
                child: Image(
                  image: AssetImage(Strings.vector),
                  height: 22,
                  width: 22,
                ),
              ),
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return resturantView();
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget resturantView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.33,
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                    image: AssetImage(Strings.minnow), fit: BoxFit.fill),
              ),
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
                      SizedBox(height: 4),
                      appText(
                        title: 'Chinese Food',
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.yellow[700],
                          ),
                          appText(
                            title: '5.0 (230 Review)',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutResturantPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppData.primary),
                      child: Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void priceFilter() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 15),
                decoration: BoxDecoration(
                  color: AppData.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                            height: 3, width: 70, color: Colors.grey)),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: appText(
                        title: 'Food Resturant Category',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 15),
                    Wrap(
                      children: [
                        foodCategory(
                          title: 'Italian',
                          textColor: (italian == false)
                              ? Colors.white
                              : AppData.primary,
                          buttonColor: (italian == false)
                              ? AppData.primary
                              : Colors.white,
                          onTap: () {
                            setState(() {
                              italian = !italian;
                            });
                          },
                        ),
                        foodCategory(
                          title: 'Continental',
                          textColor: (continental == true)
                              ? Colors.white
                              : AppData.primary,
                          buttonColor: (continental == true)
                              ? AppData.primary
                              : Colors.white,
                          onTap: () {
                            setState(() {
                              continental = !continental;
                            });
                          },
                        ),
                        foodCategory(
                          title: 'Indian',
                          textColor:
                              (indian == true) ? Colors.white : AppData.primary,
                          buttonColor:
                              (indian == true) ? AppData.primary : Colors.white,
                          onTap: () {
                            setState(() {
                              indian = !indian;
                            });
                          },
                        ),
                        foodCategory(
                          title: 'Mediterranean',
                          textColor: (mediterranean == true)
                              ? Colors.white
                              : AppData.primary,
                          buttonColor: (mediterranean == true)
                              ? AppData.primary
                              : Colors.white,
                          onTap: () {
                            setState(() {
                              mediterranean = !mediterranean;
                            });
                          },
                        ),
                        foodCategory(
                          title: 'Japanese',
                          textColor: (japanese == true)
                              ? Colors.white
                              : AppData.primary,
                          buttonColor: (japanese == true)
                              ? AppData.primary
                              : Colors.white,
                          onTap: () {
                            setState(() {
                              japanese = !japanese;
                            });
                          },
                        ),
                        foodCategory(
                          title: 'French',
                          textColor:
                              (french == true) ? Colors.white : AppData.primary,
                          buttonColor:
                              (french == true) ? AppData.primary : Colors.white,
                          onTap: () {
                            setState(() {
                              french = !french;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  Widget foodCategory({
    String title,
    Function onTap,
    Color buttonColor,
    Color textColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 35,
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: AppData.primary),
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: appText(
            title: title,
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

import 'package:airportcart/Shopping_Experience/filters.dart';
import 'package:airportcart/Shopping_Experience/product_singleview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int _choiceIndex = 0;
  bool favorite = false;
  var timeSelect = '0';
  bool showAppbar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statusBar(context),
          Visibility(
            visible: !showAppbar,
            child: customMainAppBar(
                title: 'Nike Brand',
                icon: Icons.arrow_back_ios,
                onTab: () {
                  Navigator.pop(context);
                },
                onPressed: () {
                  setState(() {
                    showAppbar = true;
                  });
                },
                trailing: Icons.search),
          ),
          Visibility(
            visible: showAppbar,
            child: customMainAppBarSearch(
                icon: Icons.arrow_back_ios,
                onTab: () {
                  setState(() {
                    showAppbar = false;
                  });
                },
                iconEnd: Icons.mic_none_rounded,
                onPress: () {}),
          ),

          _buildChoiceChips(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Filters()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.filter_list_rounded,
                      color: AppData.greyDark,
                      size: 20,
                    ),
                    appText(
                        title: 'Filters',
                        fontSize: 12,
                        color: AppData.greyDark),
                  ],
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  priceFilter();
                },
                child: Row(
                  children: [
                    Image.asset(
                      Strings.price_filter,
                      width: 15,
                      color: AppData.greyDark,
                    ),
                    appText(
                        title: 'Price:lowest to high',
                        fontSize: 12,
                        color: AppData.greyDark),
                  ],
                ),
              )
            ],
          ),
          Divider(height: 20),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: List.generate(
                  categories.length,
                  (i) {
                    return cat(categories, i);
                  },
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     // height: 165,
          //     width: MediaQuery.of(context).size.width,
          //     child: ListView.builder(
          //       itemCount: .length,
          //       shrinkWrap: true,
          //       // scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, i) {
          //         return cat(categories, i);
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildChoiceChips() {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: 60,
      child: ListView.builder(
        itemCount: _choices.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: ChoiceChip(
              label: Text(_choices[index]),
              selected: _choiceIndex == index,
              selectedColor: AppData.greyDark,
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;
                });
              },
              backgroundColor: AppData.grey,
              labelStyle: TextStyle(color: AppData.white),
            ),
          );
        },
      ),
    );
  }

  Widget cat(data, i) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductSingleView()));
      },
      child: Container(
        // margin: EdgeInsets.only(left: 15,right: 15),
        // height: 300,
        // width: 100,
        decoration: BoxDecoration(
          // color: AppData.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppData.greyLight, width: 1),
          // boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    data[i]['image'],
                    // color: (select == data[i]['id'])
                    //     ? AppData.white
                    //     : AppData.primary,
                    height: 120,
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.cover,
                    // width: 70,
                  ),
                ),
                data[i]['discount'] == ''
                    ? Container()
                    : Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        // width: 30,
                        // height: 30,
                        decoration: BoxDecoration(
                          color: AppData.primary,
                          borderRadius: BorderRadius.circular(25),
                          // border: Border.all(color: Colors.blue, width: 1),
                          // boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)
                          // ],
                        ),
                        child: appText(
                            title: '-' + data[i]['discount'],
                            fontSize: 10,
                            color: AppData.white),
                      ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                          child: Image.asset(
                            Strings.rating5,
                            height: 9,
                            // color: Colors.red,
                          ),
                        ),
                        appText(
                          title: '(10)',
                          fontSize: 12,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 105, right: 5),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: AppData.white,
                        borderRadius: BorderRadius.circular(25),
                        // border: Border.all(color: Colors.blue, width: 1),
                        boxShadow: [
                          BoxShadow(
                              color: AppData.greyLight,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 1)
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            favorite = !favorite;
                          });
                        },
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: !favorite ? AppData.grey : AppData.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: appText(
                            title: data[i]['name'],
                            fontSize: 14,
                            maxLines: 2,
                            color: Colors.indigo),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          appText(
                            title: data[i]['price'],
                            fontSize: 14,
                            color: AppData.primary,
                          ),
                          SizedBox(width: 10),
                          appText(
                            title: data[i]['dprice'],
                            fontSize: 14,
                            textDecoration: TextDecoration.lineThrough,
                            color: AppData.grey,
                          ),
                        ],
                      ),
                    ],
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
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 20, 15),
              decoration: BoxDecoration(
                color: AppData.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                boxShadow: [
                  new BoxShadow(
                    // color: AppData.mainblue,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: appText(
                        title: 'Sort by', color: AppData.black, fontSize: 16),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Container(
                  //     width: 25,
                  //     height: 25,
                  //     decoration: BoxDecoration(
                  //         color: AppData.primary,
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child: Icon(
                  //       Icons.close,
                  //       color: AppData.white,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Container(
                    // height: 165,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: appointment.length,
                      shrinkWrap: true,
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return doctorTimes(appointment, i);
                      },
                    ),
                  ),
                  // Container(
                  //   child: appText(
                  //       title: 'Popular', color: Colors.black87, fontSize: 16),
                  // ),
                  // SizedBox(height: 10),
                  // Container(
                  //   child: appText(
                  //       title: 'Popular', color: Colors.black87, fontSize: 16),
                  // ),
                  // Row(
                  //   children: [
                  //     Icon(Icons.delete_rounded, color: Colors.black87),
                  //     SizedBox(width: 10),
                  //     appText(
                  //         title: 'Delete', color: Colors.black87, fontSize: 16),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget doctorTimes(data, i) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return InkWell(
        onTap: () {
          setState(() {
            timeSelect = appointment[i]['id'];
          });
        },
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          // height: 35,
          // width: 100,
          decoration: BoxDecoration(
            color: (timeSelect == appointment[i]['id'])
                ? AppData.primary
                : AppData.white,
            // borderRadius: BorderRadius.circular(4),
            // boxShadow: [
            //   BoxShadow(color: AppData.primary, blurRadius: 2),
            // ]
          ),
          child: appText(
            title: appointment[i]['name'],
            fontSize: 14,
            textAlign: TextAlign.start,
            color: (timeSelect == data[i]['id'])
                ? AppData.white
                : AppData.greyDark,
          ),
        ),
      );
    });
  }
}

List<String> _choices = ["Male", "Female"];

List<Map<String, dynamic>> categories = [
  {
    'image': Strings.product_1,
    'name': 'Nike Air Max 270 React ENG',
    'discount': '20\%',
    'price': '\$299.43',
    'dprice': '\$534.33',
  },
  {
    'image': Strings.product_2,
    'name': 'Nike Air Max 270 React ENG',
    'discount': '',
    'price': '\$299.43',
    'dprice': '\$534.33',
  },
  {
    'image': Strings.product_3,
    'name': 'Nike Air Max 270 React ENG',
    'discount': '',
    'price': '\$299.43',
    'dprice': '\$534.33',
  },
  {
    'image': Strings.product_4,
    'name': 'Nike Air Max 270 React ENG',
    'discount': '20\%',
    'price': '\$299.43',
    'dprice': '\$534.33',
  },
  {
    'image': Strings.product_1,
    'name': 'Nike Air Max 270 React ENG',
    'discount': '20\%',
    'price': '\$299.43',
    'dprice': '\$534.33',
  },
];

List<Map<String, dynamic>> appointment = [
  {'id': '0', 'name': 'Popular'},
  {'id': '1', 'name': 'Newest'},
  {'id': '2', 'name': 'Customer review'},
  {'id': '3', 'name': 'Price: lowest to high'},
  {'id': '4', 'name': 'Price: highest to low'},
];

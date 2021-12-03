import 'package:airportcart/Shopping_Experience/brand_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  RangeValues _currentRangeValues = const RangeValues(90, 125);
  String startValue = '90';
  String endValue = '125';
  String selected = "black";
  String sizeSelected = '6';
  String selectCategory = '0';

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
            title: 'Filters',
            alignment: Alignment.center,
            icon: Icons.arrow_back_ios,
            onTab: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: appText(
                        title: 'Price Range',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppData.black,
                      ),
                    ),

                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText(
                            title: '\$ $startValue',
                            fontSize: 14,
                            color: AppData.black,
                          ),
                          appText(
                            title: '\$ $endValue',
                            fontSize: 14,
                            color: AppData.black,
                          ),
                        ],
                      ),
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 78,
                      max: 143,
                      inactiveColor: AppData.greyLight,
                      activeColor: AppData.primary,
                      divisions: 65,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          setState(() {
                            startValue =
                                _currentRangeValues.start.round().toString();
                            endValue =
                                _currentRangeValues.end.round().toString();
                          });
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    Divider(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: appText(
                        title: 'Colors',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppData.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 65,
                      padding: EdgeInsets.all(10),
                      // width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: colors.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return colorsDetails(colors, i);
                        },
                      ),
                    ),
                    Divider(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: appText(
                        title: 'Size',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppData.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 65,
                      padding: EdgeInsets.all(10),
                      // width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: size.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return sizeDetails(size, i);
                        },
                      ),
                    ),
                    Divider(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: appText(
                        title: 'Category',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppData.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // height: 65,
                      padding: EdgeInsets.all(10),
                      // width: MediaQuery.of(context).size.width,
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 2.0,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        physics: BouncingScrollPhysics(),
                        children: List.generate(categoryList.length, (i) {
                          return categoryShow(categoryList, i);
                        }),
                      ),
                    ),
                    Divider(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BrandFilter()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText(
                                  title: 'Brand',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppData.black,
                                ),
                                appText(
                                  title: 'Adidas, Nike',
                                  fontSize: 10,
                                  color: AppData.grey,
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(height: 20),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: customButton(
                                  margin: 0,
                                  title: 'Reset',
                                  radius: 25,
                                  textSize: 14,
                                  borderColor: AppData.grey,
                                  color: AppData.bgColor,
                                  textColor: AppData.greyDark,
                                  onTap: () {
                                    // Navigator.pop(context);
                                  }),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: customButton(
                                  margin: 0,
                                  title: 'Apply',
                                  radius: 25,
                                  textSize: 14,
                                  borderColor: AppData.primary,
                                  color: AppData.primary,
                                  textColor: AppData.white,
                                  onTap: () {
                                    // Navigator.pop(context);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Divider(height: 20),
                  ],
                ),
              ),
            ),
          ),
          // appText(title: 'Price Range', fontSize: 14, color: AppData.black),
          // Divider(height: 20),
        ],
      ),
    );
  }

  colorsDetails(colors, i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = colors[i]['id'];
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              width: 1,
              color: selected == colors[i]['id']
                  ? AppData.red
                  : Colors.transparent),
          // color: Colors.black,
        ),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 2, color: AppData.bgColor),
            color: colors[i]['id'] == 'black'
                ? AppData.black
                : colors[i]['id'] == 'white'
                    ? AppData.white
                    : colors[i]['id'] == 'blue'
                        ? Colors.blue
                        : colors[i]['id'] == 'red'
                            ? AppData.red
                            : colors[i]['id'] == 'brown'
                                ? Colors.brown
                                : Colors.pink,
          ),
        ),
      ),
    );
  }

  sizeDetails(size, i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sizeSelected = size[i]['id'];
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              width: 1,
              color: sizeSelected == size[i]['id']
                  ? Colors.transparent
                  : AppData.greyLight),
          color: sizeSelected == size[i]['id']
              ? AppData.primary
              : Colors.transparent,
        ),
        child: Center(
          child: appText(
            title: size[i]['size'],
            fontSize: 14,
            color:
                sizeSelected == size[i]['id'] ? AppData.white : AppData.black,
          ),
        ),
      ),
    );
  }

  Widget categoryShow(category, i) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: InkWell(
        onTap: () {
          setState(() {
            selectCategory = category[i]['id'];
          });
        },
        child: Container(
          // height: 35,
          // width: 100,
          decoration: BoxDecoration(
            color: (selectCategory == category[i]['id'])
                ? AppData.primary
                : AppData.bgColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: (selectCategory == category[i]['id'])
                  ? AppData.primary
                  : AppData.greyLight,
              // style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: Center(
            child: appText(
              title: category[i]['category'],
              fontSize: 14,
              color: (selectCategory == category[i]['id'])
                  ? AppData.white
                  : AppData.black,
            ),
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> colors = [
  {'id': 'black', 'color': Colors.black},
  {'id': 'white', 'color': Colors.white},
  {'id': 'blue', 'color': Colors.blue},
  {'id': 'red', 'color': Colors.red},
  {'id': 'brown', 'color': Colors.brown},
  {'id': 'pink', 'color': Colors.pink},
];

List<Map<String, dynamic>> size = [
  {'id': '6', 'size': '6'},
  {'id': '6.5', 'size': '6.5'},
  {'id': '7', 'size': '7'},
  {'id': '8', 'size': '8'},
  {'id': '9', 'size': '9'},
];

List<Map<String, dynamic>> categoryList = [
  {'id': '0', 'category': 'All'},
  {'id': '1', 'category': 'Women'},
  {'id': '2', 'category': 'Men'},
  {'id': '3', 'category': 'Boys'},
  {'id': '4', 'category': 'Girls'},
];

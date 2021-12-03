import 'package:airportcart/Shopping_Experience/rating_review.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class ProductSingleView extends StatefulWidget {
  @override
  _ProductSingleViewState createState() => _ProductSingleViewState();
}

class _ProductSingleViewState extends State<ProductSingleView> {
  String speciality;
  String color;
  bool favorite = false;
  var timeSelect = '0';
  String sizeSelected = '6';
  String selected = "black";

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
              title: 'Nike Air Max 270 React ENG',
              icon: Icons.arrow_back_ios,
              onTab: () {
                Navigator.pop(context);
              },
              onPressed: () {
                sizeFilter();
              },
              trailing: Icons.share_rounded),
          SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                      ),
                      items: imageSliders,
                    ),
                    Row(
                      children: [
                        Expanded(flex: 3, child: sizeButton()),
                        Expanded(flex: 3, child: colorButton()),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // margin: EdgeInsets.only(right: 10),
                            height: 50,
                            width: 50,
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
                                color:
                                    !favorite ? AppData.grey : AppData.primary,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(
                            title: 'Nike Air Max 270 React ENG',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppData.black),
                        appText(
                            title: '\$299,43',
                            fontSize: 20,
                            color: AppData.primary),
                      ],
                    ),
                    SizedBox(height: 5),
                    appText(
                        title: 'Nike Brand Category',
                        fontSize: 14,
                        color: AppData.grey),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(Strings.rating5, height: 15),
                        SizedBox(width: 5),
                        appText(
                            title: '(10)', fontSize: 14, color: AppData.grey),
                      ],
                    ),
                    SizedBox(height: 15),
                    appText(
                        title:
                            'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
                        fontSize: 14,
                        maxLines: 5,
                        letterSpacing: 0.5,
                        color: AppData.grey),
                    SizedBox(height: 15),
                    shoppingTitle(context,
                        mainTitle: 'Shopping Details',
                        description:
                            'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.'),
                    shoppingTitle(context,
                        mainTitle: 'Item details',
                        description:
                            'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.'),
                    shoppingTitle(context, mainTitle: 'Rating & Review',
                        ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RatingReview()));
                    },
                        description:
                            'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.'),
                    SizedBox(height: 15),
                    customButton(
                        margin: 0,
                        title: 'ADD TO CART',
                        radius: 25,
                        textSize: 14,
                        borderColor: AppData.primary,
                        color: AppData.primary,
                        textColor: AppData.white,
                        onTap: () {
                          // Navigator.pop(context);
                        }),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(
                            title: 'You can also like this',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppData.black),
                        appText(
                            title: '12 items',
                            fontSize: 12,
                            color: AppData.grey),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      height: MediaQuery.of(context).size.height * 0.37,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return cat(categories, i);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget shoppingTitle(BuildContext context,
      {String mainTitle, String description, Function ontap}) {
    return ExpansionTile(
      title: GestureDetector(
        onTap: ontap,
        child: appText(
            title: mainTitle,
            fontSize: 14,
            letterSpacing: 0.5,
            color: AppData.black),
      ),
      children: [
        ListTile(
          title: InkWell(
            onTap: () {},
            child: Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: appText(
                        title: description,
                        fontSize: 14,
                        maxLines: 5,
                        letterSpacing: 0.5,
                        color: AppData.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000)),
            ),
          ))
      .toList();

  Widget sizeButton() {
    return Padding(
      padding: EdgeInsets.only(right: 12, left: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: AppData.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 0.2, color: AppData.primary)),
        child: DropdownButtonFormField(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: AppData.black,
            ),
          ),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: 'Size',
          ),
          value: speciality,
          onChanged: (value) {
            setState(() {
              speciality = value;
            });
          },
          items: <String>[
            '6',
            '6.5',
            '7',
            '8',
            '9',
          ].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          // items: categorylist
          //     .map(
          //       (categoryTitle) => DropdownMenuItem(
          //           value: categoryTitle['number'],
          //           child: Text("${categoryTitle['name']}")),
          //     )
          //     .toList(),
        ),
      ),
    );
  }

  Widget colorButton() {
    return Padding(
      padding: EdgeInsets.only(right: 12, left: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: AppData.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 0.2, color: AppData.primary)),
        child: DropdownButtonFormField(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: AppData.black,
            ),
          ),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: 'Color',
          ),
          value: color,
          onChanged: (value) {
            setState(() {
              color = value;
            });
          },
          items: <String>[
            'black',
            'white',
            'blue',
            'red',
            'brown',
            'pink',
          ].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          // items: categorylist
          //     .map(
          //       (categoryTitle) => DropdownMenuItem(
          //           value: categoryTitle['number'],
          //           child: Text("${categoryTitle['name']}")),
          //     )
          //     .toList(),
        ),
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
        margin: EdgeInsets.only(left: 10, right: 10),
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.45,
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
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        // width: 30,
                        // height: 30,
                        decoration: BoxDecoration(
                          color: AppData.black,
                          borderRadius: BorderRadius.circular(25),
                          // border: Border.all(color: Colors.blue, width: 1),
                          // boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)
                          // ],
                        ),
                        child: appText(
                            title: 'new', fontSize: 10, color: AppData.white),
                      )
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

  void colorFilter() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
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
                        title: 'Select Color',
                        color: AppData.black,
                        fontSize: 16),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 55,
                    padding: EdgeInsets.all(5),
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
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      sizeFilter();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText(
                              title: 'Size',
                              color: AppData.black,
                              fontSize: 16),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppData.black,
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void sizeFilter() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
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
                        title: 'Select Size',
                        color: AppData.black,
                        fontSize: 16),
                  ),
                  SizedBox(height: 30),
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
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      colorFilter();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText(
                              title: 'Color',
                              color: AppData.black,
                              fontSize: 16),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppData.black,
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  colorsDetails(colors, i) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
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
    });
  }

  sizeDetails(size, i) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
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
    });
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

final List<String> imgList = [
  Strings.product_5,
  Strings.product_5,
  Strings.product_5,
  Strings.product_5,
  Strings.product_5,
];

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

List<Map<String, dynamic>> size = [
  {'id': '6', 'size': '6'},
  {'id': '6.5', 'size': '6.5'},
  {'id': '7', 'size': '7'},
  {'id': '8', 'size': '8'},
  {'id': '9', 'size': '9'},
];

import 'package:airportcart/Shopping_Experience/shopping_order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  bool favorite = false;
  bool showAppbar = false;
  int j = 1;
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: AppData.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statusBar(context),
          Visibility(
            visible: !showAppbar,
            child: customMainAppBar(
                title: 'My Cart',
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
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      // height: 165,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: cart.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return cat(cart, i);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: searchbar(
                        context: context,
                        color: AppData.bgColor,
                        // prefix: SizedBox(width: 1),
                        border: Border.all(color: AppData.primary, width: 0.5),
                        controller: search,
                        read: true,
                        suffiximage: Container(
                          decoration: BoxDecoration(
                            color: AppData.primary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            child: Icon(Icons.arrow_forward,
                                color: AppData.white, size: 20),
                            onTap: () {
                              // FocusScope.of(context).requestFocus(FocusNode());
                              priceFilter();
                            },
                          ),
                        ),
                        hint: 'Enter your promo code',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText(
                              title: 'Total amount:',
                              fontSize: 16,
                              color: AppData.grey),
                          appText(
                              title: '124\$',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppData.black),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: customButton(
                          margin: 0,
                          title: 'CHECK OUT',
                          radius: 25,
                          textSize: 14,
                          borderColor: AppData.primary,
                          color: AppData.primary,
                          textColor: AppData.white,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShippingOrderDetails()));
                            // Navigator.pop(context);
                          }),
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

  Widget cat(cart, i) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Product()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        // height: 300,
        // width: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppData.greyLight, width: 1),
          // boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              child: Image.asset(
                cart[i]['image'],
                // color: (select == data[i]['id'])
                //     ? AppData.white
                //     : AppData.primary,
                height: 120,
                width: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.cover,
                // width: 70,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: appText(
                            title: cart[i]['name'],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppData.black),
                      ),
                      PopupMenuButton(
                        icon: Icon(Icons.more_vert,
                            color: AppData.grey, size: 24),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'favorites',
                              child: Row(
                                children: [
                                  Icon(Icons.favorite_border_outlined,
                                      color: AppData.grey, size: 18),
                                  SizedBox(width: 5),
                                  Text('Add to favorites'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete_forever_outlined,
                                      color: AppData.grey, size: 18),
                                  SizedBox(width: 5),
                                  Text('Delete from the list'),
                                ],
                              ),
                            )
                          ];
                        },
                        // onSelected: (String value) =>
                        //     actionPopUpItemSelected(value, 'delete'),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                          title: 'Color: ', fontSize: 10, color: AppData.grey),
                      appText(
                          title: cart[i]['color'],
                          fontSize: 10,
                          color: AppData.black),
                      SizedBox(width: 15),
                      appText(
                          title: 'Size: ', fontSize: 10, color: AppData.grey),
                      appText(
                          title: cart[i]['Size'],
                          fontSize: 10,
                          color: AppData.black),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FloatingActionButton(
                              // isExtended: true,
                              heroTag: null,
                              child: Icon(Icons.remove, color: AppData.grey),
                              mini: true,
                              backgroundColor: AppData.white,
                              onPressed: () {
                                setState(() {
                                  // ignore: unnecessary_statements
                                  j > 1 ? j-- : j;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            appText(
                                title: j.toString(),
                                fontSize: 14,
                                color: AppData.black),
                            SizedBox(width: 5),
                            FloatingActionButton(
                              // isExtended: true,
                              heroTag: null,
                              child: Icon(Icons.add, color: AppData.grey),
                              mini: true,
                              backgroundColor: AppData.white,
                              onPressed: () {
                                setState(() {
                                  j++;
                                });
                              },
                            ),
                          ],
                        ),
                        appText(
                            title: cart[i]['price'],
                            fontSize: 14,
                            color: AppData.black),
                      ],
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

  void actionPopUpItemSelected(String value, String name) {
    // ignore: deprecated_member_use
    _scaffoldkey.currentState.hideCurrentSnackBar();
    String message;
    if (value == 'edit') {
      message = 'You selected edit for $name';
    } else if (value == 'delete') {
      message = 'You selected delete for $name';
    } else {
      message = 'Not implemented';
    }
    final snackBar = SnackBar(content: Text(message));
    // ignore: deprecated_member_use
    _scaffoldkey.currentState.showSnackBar(snackBar);
  }

  void priceFilter() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 20, 15),
            decoration: BoxDecoration(
              color: AppData.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              boxShadow: [
                new BoxShadow(
                  // color: AppData.mainblue,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Container(
                color: AppData.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // width: 150,
                      // color: Colors.red,
                      child: searchbar(
                        context: context,
                        read: false,
                        // prefix: SizedBox(width: 1),
                        border: Border.all(color: AppData.primary, width: 0.5),
                        controller: search,
                        color: AppData.white,
                        suffiximage: Container(
                          decoration: BoxDecoration(
                            color: AppData.primary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            child: Icon(Icons.arrow_forward,
                                color: AppData.white, size: 20),
                            onTap: () {
                              // FocusScope.of(context).requestFocus(FocusNode());
                              // priceFilter();
                            },
                          ),
                        ),
                        hint: 'Promo Code',
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: appText(
                          title: 'Sort by', color: AppData.black, fontSize: 16),
                    ),
                    appText(
                        title: 'Your Promo Codes',
                        color: AppData.black,
                        fontSize: 16),
                    SizedBox(height: 10),
                    Container(
                      // height: 165,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: appointment.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return offer(appointment, i);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget offer(data, i) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return InkWell(
        onTap: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Product()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          // height: 300,
          // width: 100,
          decoration: BoxDecoration(
            color: AppData.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppData.greyLight, width: 0.5),
            // boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                child: Image.asset(
                  data[i]['image'],
                  // color: (select == data[i]['id'])
                  //     ? AppData.white
                  //     : AppData.primary,
                  height: 90,
                  width: MediaQuery.of(context).size.width * 0.25,
                  fit: BoxFit.cover,
                  // width: 70,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                        title: 'Personal offer',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppData.black),
                    SizedBox(height: 5),
                    appText(
                        title: 'mypromocode2021',
                        fontSize: 10,
                        color: AppData.black),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    appText(
                        title: '${data[i]['days']} days remaining',
                        fontSize: 10,
                        color: AppData.grey),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: customButton(
                          margin: 0,
                          padding: 8,
                          width: 75.0,
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
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

List<Map<String, dynamic>> cart = [
  {
    'image': Strings.product_1,
    'name': 'Nike Air Max 270 React ENG',
    'color': 'Black',
    'Size': 'L',
    'price': '51\$',
  },
  {
    'image': Strings.product_2,
    'name': 'T-Shirt',
    'color': 'Grey',
    'Size': 'L',
    'price': '30\$',
  },
  {
    'image': Strings.product_3,
    'name': 'FS - QUILTED MAXI CROS',
    'color': 'Black',
    'Size': 'M',
    'price': '43\$',
  },
];
List<Map<String, dynamic>> appointment = [
  {'image': Strings.offer10, 'code': 'mypromocode2021', 'days': '6'},
  {'image': Strings.offer20, 'code': 'mypromocode2021', 'days': '6'},
];

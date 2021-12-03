import 'package:airportcart/Shopping_Experience/more_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  String selectButton = '0';
  bool completed = true;
  bool pending = false;
  bool cancel = false;
  String chosenReason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              itemCount: buttonList.length,
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return button(buttonList, i);
              },
            ),
          ),
          // SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                    visible: completed,
                    child: Column(
                      children: [
                        Container(
                          child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return historyCompleted();
                            },
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: pending,
                    child: Column(
                      children: [
                        Container(
                          child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return historyPending();
                            },
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: cancel,
                    child: Column(
                      children: [
                        Container(
                          child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return historyCancel();
                            },
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  historyCompleted() {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 8, left: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppData.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: AppData.greyLight, blurRadius: 1)]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(
                title: 'Duty Free- Footwear',
                color: AppData.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            SizedBox(height: 7),
            Divider(height: 2, color: AppData.grey),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Order Number:', color: AppData.grey, fontSize: 14),
                appText(
                    title: 'IW3475453455', color: AppData.black, fontSize: 14),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Total Amount:', color: AppData.grey, fontSize: 14),
                appText(title: '\$ 124.00', color: AppData.black, fontSize: 14),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Order Date & Time:',
                    color: AppData.grey,
                    fontSize: 14),
                appText(
                    title: '03-June-2021 (04:00 PM)',
                    color: AppData.black,
                    fontSize: 14),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: customButton(
                      margin: 0,
                      width: 100.0,
                      padding: 10,
                      title: 'Details',
                      radius: 25,
                      textSize: 14,
                      borderColor: AppData.greyDark,
                      color: AppData.white,
                      textColor: AppData.greyDark,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MoreDetails(value: 'submit')));
                        // Navigator.pop(context);
                      }),
                ),
                GestureDetector(
                  onTap: () {
                    priceFilter();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: appText(
                        title: 'Submit Review',
                        color: AppData.primary,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  historyPending() {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 8, left: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppData.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: AppData.greyLight, blurRadius: 1)]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(
                title: 'Duty Free- Footwear',
                color: AppData.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            SizedBox(height: 7),
            Divider(height: 2, color: AppData.grey),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Order Number:', color: AppData.grey, fontSize: 14),
                appText(
                    title: 'IW3475453455', color: AppData.black, fontSize: 14),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Total Amount:', color: AppData.grey, fontSize: 14),
                appText(title: '\$ 124.00', color: AppData.black, fontSize: 14),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Order Date & Time:',
                    color: AppData.grey,
                    fontSize: 14),
                appText(
                    title: '03-June-2021 (04:00 PM)',
                    color: AppData.black,
                    fontSize: 14),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: customButton(
                      margin: 0,
                      width: 100.0,
                      padding: 10,
                      title: 'Details',
                      radius: 25,
                      textSize: 14,
                      borderColor: AppData.greyDark,
                      color: AppData.white,
                      textColor: AppData.greyDark,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MoreDetails(value: 'pending')));
                        // Navigator.pop(context);
                      }),
                ),
                GestureDetector(
                  onTap: () {
                    cancelOrder();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: appText(
                        title: 'Cancel Order',
                        color: AppData.primary,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  historyCancel() {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 8, left: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppData.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: AppData.greyLight, blurRadius: 1)]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(
                title: 'Duty Free- Footwear',
                color: AppData.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            SizedBox(height: 7),
            Divider(height: 2, color: AppData.grey),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Order Number:', color: AppData.grey, fontSize: 14),
                appText(
                    title: 'IW3475453455', color: AppData.black, fontSize: 14),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Total Amount:', color: AppData.grey, fontSize: 14),
                appText(title: '\$ 124.00', color: AppData.black, fontSize: 14),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Order Date & Time:',
                    color: AppData.grey,
                    fontSize: 14),
                appText(
                    title: '03-June-2021 (04:00 PM)',
                    color: AppData.black,
                    fontSize: 14),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: customButton(
                      margin: 0,
                      width: 100.0,
                      padding: 10,
                      title: 'Details',
                      radius: 25,
                      textSize: 14,
                      borderColor: AppData.greyDark,
                      color: AppData.white,
                      textColor: AppData.greyDark,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MoreDetails(value: 'cancel')));
                      }),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: appText(
                        title: 'Rebooking',
                        color: AppData.primary,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  button(data, i) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectButton = data[i]['id'];
            if (selectButton == '0') {
              completed = true;
              pending = false;
              cancel = false;
            } else if (selectButton == '1') {
              completed = false;
              pending = true;
              cancel = false;
            } else {
              completed = false;
              pending = false;
              cancel = true;
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: (selectButton == data[i]['id'])
                ? AppData.primary
                : AppData.bgColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppData.primary, width: 1),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: appText(
              title: data[i]['name'],
              fontWeight: FontWeight.w500,
              color: (selectButton == data[i]['id'])
                  ? AppData.white
                  : AppData.primary,
            ),
          )),
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
          height: MediaQuery.of(context).size.height * 0.55,
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
              child: SingleChildScrollView(
                child: Container(
                  color: AppData.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      appText(
                          title: 'What is you rate?',
                          color: AppData.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      SizedBox(height: 20),
                      RatingBar.builder(
                        itemSize: 45,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        unratedColor: AppData.bgColor,
                        itemPadding: EdgeInsets.symmetric(horizontal: 5),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: appText(
                            title:
                                'Please share your opinion about the product',
                            color: AppData.black,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      kTextField(
                        hint: 'I’m super happy with these! ',
                        keyboardType: TextInputType.multiline,
                        line: 5,
                        // radius: 8,
                        obscure: false,
                        border: Border.all(width: 1, color: AppData.grey),
                        // onTap: showDatePicker,
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: customButton(
                            margin: 0,
                            title: 'SEND REVIEW',
                            radius: 25,
                            textSize: 14,
                            borderColor: AppData.primary,
                            color: AppData.primary,
                            textColor: AppData.white,
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void cancelOrder() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.66,
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
              child: SingleChildScrollView(
                child: Container(
                  color: AppData.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: appText(
                            title: 'Cancel Booking',
                            color: AppData.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      appText(
                          title: 'Are you sure to cancel your appointment?',
                          color: AppData.greyDark,
                          fontSize: 12),
                      SizedBox(height: 3),
                      appText(
                          title: 'There will not refund at all',
                          color: AppData.greyDark,
                          fontSize: 12),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: customDropDown(
                          title: 'Select Reason',
                          items: <String>[
                            'No Interested Any More',
                            'Parent\'s doctor appointment.',
                            'Stuck in traffic!',
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (String val) {
                            chosenReason = val;
                            setState(() {
                              chosenReason = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      appText(
                        title: 'Comments',
                        fontWeight: FontWeight.w500,
                        color: AppData.black,
                        fontSize: 14,
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Comments...',
                              hintStyle: TextStyle(
                                fontFamily: themeFont,
                                fontSize: 14,
                              )),
                        ),
                      ),
                      SizedBox(height: 10),
                      appText(
                        title: 'Verify',
                        fontWeight: FontWeight.w500,
                        color: AppData.black,
                        fontSize: 14,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter Verification Code',
                                  hintStyle: TextStyle(fontSize: 12),
                                  isDense: true,
                                  border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: AppData.black,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: AppData.black,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 6,
                            child: Container(
                                child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: AppData.grey, width: 1),
                                    color: AppData.primary,
                                  ),
                                  child: appText(
                                    title: 'a R H 3 i',
                                    fontSize: 16,
                                    color: AppData.white,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppData.grey, width: 1),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: appText(
                                    title: 'Change',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: customButton(
                            margin: 0,
                            title: 'Cancel Booking',
                            radius: 25,
                            textSize: 14,
                            borderColor: AppData.primary,
                            color: AppData.primary,
                            textColor: AppData.white,
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customDropDown(
      {List<DropdownMenuItem<String>> items,
      String title,
      Function onChanged}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: title,
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppData.black,
            width: 1.0,
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppData.black,
            width: 1.0,
          ),
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }

  List<Map<String, dynamic>> buttonList = [
    {'id': '0', 'name': 'Completed'},
    {'id': '1', 'name': 'Pending'},
    {'id': '2', 'name': 'Cancel'},
  ];
}

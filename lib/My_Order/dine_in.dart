import 'package:flutter/material.dart';

import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class DineInPage extends StatefulWidget {
  @override
  _DineInPageState createState() => _DineInPageState();
}

class _DineInPageState extends State<DineInPage> {
  String selectButton = '0';
  bool completed = true;
  bool pending = false;
  bool cancel = false;

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
          SizedBox(height: 10),
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
                              return dineInCompleted();
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
                              return dineInPending();
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
                              return dineInCancel();
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

  dineInCompleted() {
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
                        // Navigator.pop(context);
                      }),
                ),
                GestureDetector(
                  onTap: () {},
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

  dineInPending() {
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
                        // Navigator.pop(context);
                      }),
                ),
                GestureDetector(
                  onTap: () {},
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

  dineInCancel() {
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
                        // Navigator.pop(context);
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
            print('id:${data[i]['id']}');
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

  cancelBooking() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppData.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            height: 320,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      child:
                          Image.asset(Strings.call, height: 100, width: 100)),
                  SizedBox(height: 35),
                  appText(
                    title: 'Cancel Booking',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 10),
                  appText(
                      title:
                          'Are you sure to cancel your appointment? There will not refund at all',
                      fontSize: 16,
                      maxLines: 2,
                      color: AppData.grey),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: customButton(
                        margin: 0,
                        title: 'Cancel Appointment',
                        color: AppData.primary,
                        textColor: AppData.white,
                        borderColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => CancelAppointment()));

                          // Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<Map<String, dynamic>> buttonList = [
    {'id': '0', 'name': 'Completed'},
    {'id': '1', 'name': 'Pending'},
    {'id': '2', 'name': 'Cancel'},
  ];
}

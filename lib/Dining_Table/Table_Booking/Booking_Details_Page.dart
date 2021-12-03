import 'package:airportcart/Dining_Table/Payment_Page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:airportcart/Dining_Table/Table_Booking/Payment_Cancel_Policy.dart';

class BookingDetailsPage extends StatefulWidget {
  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController bookingcharge = TextEditingController();
  TextEditingController paymentmethod = TextEditingController();
  TextEditingController airportLocation = TextEditingController();
  TextEditingController guest = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  var pickedTime;
  List categorylist = [];
  dynamic speciality;
  var timeSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Booking Details',
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: walletTextField(
                              label: 'Date',
                              controller: date,
                              hintText: 'Date',
                              suffixIcon: Icon(CupertinoIcons.calendar,
                                  color: Colors.black),
                              readOnly: true,
                              onTap: showDatePicker),
                        ),
                        Flexible(
                          flex: 4,
                          child: walletTextField(
                            label: 'Time',
                            controller: time,
                            hintText: 'Time',
                            suffixIcon:
                                Icon(Icons.access_time, color: Colors.black),
                            readOnly: true,
                            onTap: dilogbutton,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText(
                                  title: 'Table No.',
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 8),
                                sizeButton(),
                              ],
                            )),
                        Flexible(
                          flex: 4,
                          child: walletTextField(
                              label: 'Guest',
                              controller: guest,
                              hintText: 'Number of Guest',
                              keybord: TextInputType.number),
                        ),
                      ],
                    ),
                    walletTextField(
                      label: 'Your Name',
                      controller: name,
                      hintText: 'Name',
                      suffixIcon: Icon(FeatherIcons.user, color: Colors.black),
                    ),
                    walletTextField(
                      label: 'Email',
                      controller: email,
                      hintText: 'email0@gmail.com',
                      suffixIcon:
                          Icon(CupertinoIcons.envelope, color: Colors.black),
                    ),
                    walletTextField(
                      label: 'Phone Number',
                      controller: number,
                      hintText: 'Phone Number',
                      keybord: TextInputType.number,
                      suffixIcon: Icon(FeatherIcons.phone, color: Colors.black),
                    ),
                    walletTextField(
                      label: 'Booking Charges',
                      controller: bookingcharge,
                      hintText: 'Booking Charges',
                      keybord: TextInputType.number,
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text:
                                'This booking charges will adjust when you order the food at this resturant.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Cancellation Policy',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppData.primary,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              PaymentCancelPolicy()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    walletTextField(
                      label: 'Payment Method',
                      controller: paymentmethod,
                      hintText: 'Payment Method',
                      suffixIcon:
                          Icon(Icons.arrow_forward_ios, color: Colors.black),
                    ),
                    walletTextField(
                      label: 'Airport Location',
                      controller: airportLocation,
                      hintText: 'Airport Location',
                      suffixIcon: Icon(Icons.location_searching_sharp,
                          color: Colors.black),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    customButton(
                      title: 'CONTINUE',
                      margin: 6,
                      textColor: Colors.white,
                      radius: 25,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()));
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.now(),
      minTime: DateTime(1970),
      maxTime: DateTime(2100),
      onConfirm: (selecteDate) {
        setState(() {
          date.text = DateFormat('yyyy-MM-dd').format(selecteDate);
        });
      },
    );
  }

  Widget sizeButton() {
    return Padding(
      padding: EdgeInsets.only(right: 12, left: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 0.2,
              color: Colors.grey.shade200,
            )),
        child: DropdownButtonFormField(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
          ),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: 'Select Table',
          ),
          value: speciality,
          onChanged: (value) {
            setState(() {
              speciality = value;
            });
          },
          items: <String>[
            'Table No. 01',
            'Table No. 02',
            'Table No. 03',
            'Table No. 04',
            'Table No. 05',
            'Table No. 06',
            'Table No. 07',
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

  dilogbutton() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(0),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(
                        title: 'Selected Time',
                        fontSize: 16,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel_sharp,
                          color: AppData.primary,
                          size: 26,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: timepicker(
                          controller: start,
                          hintText: 'Time',
                          suffixIcon: Icon(
                            Icons.unfold_more_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                          readOnly: true,
                          onTap: () {
                            DatePicker.showTime12hPicker(context,
                                showTitleActions: true, onConfirm: (date) {
                              start.text = DateFormat.jm().format(date);
                            }, locale: LocaleType.en);
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        flex: 2,
                        child: timepicker(
                          controller: time,
                          hintText: 'Time',
                          suffixIcon: Icon(
                            Icons.unfold_more_outlined,
                            size: 24,
                            color: Colors.black,
                          ),
                          readOnly: true,
                          onTap: () {
                            DatePicker.showTime12hPicker(context,
                                showTitleActions: true, onConfirm: (date) {
                              time.text = DateFormat.jm().format(date);
                            }, locale: LocaleType.en);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Align(
                    alignment: Alignment.topLeft,
                    child: appText(
                      title: 'Available Slot Timing',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  doctorTime(),
                ],
              ),
            ),
            actions: [
              SizedBox(
                height: 40,
                child: customButton(
                  title: 'Select',
                  textSize: 15,
                  textColor: Colors.white,
                  radius: 6,
                  onTap: () {
                    Navigator.pop(context);
                    changetime();
                  },
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.22),
            ],
          );
        });
      },
    );
  }

  changetime() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(0),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel_sharp,
                        color: AppData.primary,
                        size: 26,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Image(
                    image: AssetImage(Strings.sorry),
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: appText(
                      title:
                          'We are sorry, we do not have any table available at your preferred time. Please choose another time.',
                      maxLines: 5,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            actions: [
              SizedBox(
                height: 40,
                child: customButton(
                  title: 'Change Time',
                  textSize: 15,
                  textColor: Colors.white,
                  radius: 6,
                  onTap: () {
                    Navigator.pop(context);
                    dilogbutton();
                  },
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.14),
            ],
          );
        });
      },
    );
  }

  Widget doctorTime() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2.0,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      physics: BouncingScrollPhysics(),
      children: List.generate(appointment.length, (i) {
        return doctorTimes(appointment, i);
      }),
    );
  }

  Widget doctorTimes(data, i) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: InkWell(
        onTap: () {
          setState(() {
            timeSelect = appointment[i]['id'];
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: (timeSelect == appointment[i]['id'])
                ? AppData.primary
                : AppData.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppData.primary,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: Center(
            child: appText(
              title: appointment[i]['time'],
              fontSize: 14,
              color: (timeSelect == data[i]['id'])
                  ? Colors.white
                  : AppData.primary,
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> appointment = [
    {'id': '0', 'time': '10:00 AM'},
    {'id': '1', 'time': '10:30 AM'},
    {'id': '2', 'time': '11:00 AM'},
    {'id': '3', 'time': '11:30 AM'},
    {'id': '4', 'time': '12:00 PM'},
    {'id': '5', 'time': '12:30 PM'},
  ];
}

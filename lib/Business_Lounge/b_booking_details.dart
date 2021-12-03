import 'package:airportcart/Business_Lounge/b_cancellation_policy.dart';
import 'package:airportcart/Business_Lounge/b_payment_page.dart';
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

class BusinessBookingDetails extends StatefulWidget {
  @override
  _BusinessBookingDetailsState createState() => _BusinessBookingDetailsState();
}

class _BusinessBookingDetailsState extends State<BusinessBookingDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController bookingCharge = TextEditingController();
  TextEditingController hourlyRate = TextEditingController();
  TextEditingController paymentMethod = TextEditingController();
  TextEditingController airportLocation = TextEditingController();
  TextEditingController guest = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  var pickedTime;
  List categoryList = [];
  dynamic speciality;
  dynamic hoursRate;
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
                    walletTextField(
                      label: 'Your Name',
                      controller: name,
                      hintText: 'Name',
                      suffixIcon: Icon(FeatherIcons.user, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Email',
                      controller: email,
                      hintText: 'email0@gmail.com',
                      suffixIcon:
                          Icon(CupertinoIcons.envelope, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Phone Number',
                      controller: number,
                      hintText: 'Phone Number',
                      keybord: TextInputType.number,
                      suffixIcon:
                          Icon(FeatherIcons.phone, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Price Hourly Rate',
                      controller: hourlyRate,
                      hintText: 'Price Hourly Rate(\$)',
                      keybord: TextInputType.number,
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      alignment: Alignment.bottomLeft,
                      child: appText(
                        title: 'How Many Hour You Want',
                        letterSpacing: 0.5,
                        color: AppData.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: hoursButton()),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: walletTextField(
                              label: 'Date',
                              controller: date,
                              hintText: 'Date',
                              suffixIcon: Icon(CupertinoIcons.calendar,
                                  color: AppData.black),
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
                                Icon(Icons.access_time, color: AppData.black),
                            readOnly: true,
                            onTap: dialogButton,
                          ),
                        ),
                      ],
                    ),
                    walletTextField(
                      label: 'Guest',
                      controller: guest,
                      hintText: 'Number of Guest',
                      keybord: TextInputType.number,
                      suffixIcon: Icon(FeatherIcons.user, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Total Charges',
                      controller: bookingCharge,
                      hintText: 'Total Charges(\$)',
                      keybord: TextInputType.number,
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text:
                                'Cancel up to 24 hours prior to your booking time to get a full refund..',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppData.grey,
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
                                              BusinessCancellationPolicy()),
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
                      controller: paymentMethod,
                      hintText: 'Payment Method',
                      suffixIcon:
                          Icon(Icons.arrow_forward_ios, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Airport Location',
                      controller: airportLocation,
                      hintText: 'Airport Location',
                      suffixIcon: Icon(Icons.location_searching_sharp,
                          color: AppData.black),
                    ),
                    SizedBox(height: 25),
                    customButton(
                      title: 'CONTINUE',
                      margin: 6,
                      textColor: AppData.white,
                      radius: 25,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BusinessPaymentPage()));
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
      onConfirm: (selectDate) {
        setState(() {
          date.text = DateFormat('yyyy-MM-dd').format(selectDate);
        });
      },
    );
  }

  Widget hoursButton() {
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
              color: AppData.black,
            ),
          ),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: 'Select Hours time',
          ),
          value: hoursRate,
          onChanged: (value) {
            setState(() {
              hoursRate = value;
            });
          },
          items: <String>[
            '1 Hour',
            '2 Hours',
            '3 Hours',
            '4 Hours',
            '5 Hours',
            '6 Hours',
            '7 Hours',
            '8 Hours',
          ].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  dialogButton() {
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
                            color: AppData.black,
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
                            color: AppData.black,
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
                  textColor: AppData.white,
                  radius: 6,
                  onTap: () {
                    Navigator.pop(context);
                    changeTime();
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

  changeTime() async {
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
                      icon: Icon(Icons.cancel_sharp,
                          color: AppData.primary, size: 26),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Image(
                      image: AssetImage(Strings.sorry),
                      height: 150,
                      width: 150),
                  SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: appText(
                        title:
                            'We are sorry, we do not have any table available at your preferred time. Please choose another time.',
                        maxLines: 5,
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        letterSpacing: 0.5),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            actions: [
              SizedBox(
                height: 45,
                child: customButton(
                  title: 'Change Time',
                  textSize: 15,
                  textColor: AppData.white,
                  radius: 6,
                  onTap: () {
                    Navigator.pop(context);
                    dialogButton();
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
                  ? AppData.white
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
